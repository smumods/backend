class Professor < ApplicationRecord
    # FriendlyId Slug
    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_many :professor_courses, inverse_of: :professors
    has_many :courses, through: :professor_courses
    has_many :reviews, inverse_of: :reviews

    # Bookmarks/Likes/Etc
    # has_many :like_by_users
end
