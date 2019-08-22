class Event < ApplicationRecord
  # Relationships
  belongs_to :club
  has_many :rsvps
  has_many :users, through: :rsvps

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :color, inclusion: { in: ["background: rgba(7,64,249,0.70);", "background: rgba(218,27,18,0.70);", "background: rgba(124,157,126,0.70);", "background: rgba(76,80,87,0.70);"] }

  # Attachments
  has_one_attached :image
  has_many_attached :gallery

  # Scopes
  scope :with_eager_loaded_gallery, -> { eager_load(gallery_attachments: :blob) }
  scope :with_preloaded_gallery, -> { preload(gallery_attachments: :blob) }

  # Callbacks
  after_create :notify_members_of_event

  def formatted_start_date
    self.start_date.strftime("%d %b (%a) %l:%m %p")
  end

  def formatted_end_date
    self.end_date.strftime("%d %b (%a) %l:%m %p")
  end

  def price
    self[:price].nil? ? "No Price Set" : self[:price]
  end

  def require_rsvp
    self[:require_rsvp] ? "Yes" : "No"
  end

  private
  def notify_members_of_event
    self.club.club_memberships.each do |user|
      NotificationsWorker.perform_async(
        :notify_members_of_event,
        user.id,
        {
          image: self.image.service_url,
          message: "<b>#{self.club.name}</b> is organizing an event: \n\n<b>Event Name:</b> #{self.name}\n<b>Date & Time:</b> #{self.formatted_start_date}\n<b>Location:</b> #{self.location}"
        })
    end
  end
end
