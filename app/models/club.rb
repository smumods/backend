class Club < ApplicationRecord
    # FriendlyId
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    # Validations
    validates :name, uniqueness: true
    validates :name, presence: true, length: { minimum: 3 }
    validates :slug, uniqueness: true
    validates :slug, presence: true, length: { minimum: 3 }
    validates :description, presence: true
    validates :gallery, length: {
        maximum: 6,
        message: "You can only setup 5 images for your gallery"
    }
    validates :display_picture, presence: true

    # Relationships
    has_one :club_admin
    has_many :club_admin_delegates
    has_many :club_managers, through: :club_admin_delegates, source: :user
    has_many :club_members
    has_many :club_memberships, through: :club_members, source: :user
    has_many :events

    # Attachments
    has_one_attached :display_picture
    has_many_attached :gallery

    def self.display_picture_sizes
      {
        thumbnail: { resize: "160x160" }
      }
    end

    def display_picture_sized(size)
      self.display_picture.variant(Club.display_picture_sizes[size]).processed
    end

    # Others
    serialize :gallery, Array

    # Callbacks
    after_create :generate_thumbnail

    def slug_candidates
        [:name, :name_and_sequence]
    end

    # Might be redundant since we have constraints on name itself (cant be duplicate)
    def name_and_sequence
        slug = name.to_param
        sequence = self.class.where("slug like '#{slug}-%'").count + 2
        "#{slug}-#{sequence}"
    end
end
