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

    # Relationships
    has_one :club_admin

    # Others
    serialize :gallery, Array

    # Callbacks
    before_save :remove_blank_gallery_pictures

    def slug_candidates
        [:name, :name_and_sequence]
    end

    # Might be redundant since we have constraints on name itself (cant be duplicate)
    def name_and_sequence
        slug = name.to_param
        sequence = self.class.where("slug like '#{slug}-%'").count + 2
        "#{slug}-#{sequence}"
    end

    def remove_blank_gallery_pictures
        gallery.reject!(&:blank?)
    end
end
