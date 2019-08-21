class Event < ApplicationRecord
  # Relationships
  belongs_to :club
  has_many :rsvps
  has_many :users, through: :rsvps

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :main_image, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :color, inclusion: { in: ["background: rgba(7,64,249,0.70);", "background: rgba(218,27,18,0.70);", "background: rgba(124,157,126,0.70);", "background: rgba(76,80,87,0.70);"] }

  # Attachments
  has_one_attached :image
  has_many_attached :gallery

  # Callbacks
  after_create :notify_members_of_event

  private
  def notify_members_of_event
    self.club.club_memberships.each do |user|
      binding.pry
      NotificationsWorker.perform_async(:notify_members_of_event, user.id, { image: self.main_image, message: "[#{self.club.name}] #{self.name} will be organizing an event on #{self.start_date} at #{self.location}" })
    end
  end
end
