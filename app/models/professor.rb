class Professor < ApplicationRecord
    # FriendlyId Slug
    extend FriendlyId
    friendly_id :name, use: :slugged

    # Relationships
    has_many :professor_courses
    has_many :courses, through: :professor_courses
    has_many :reviews

    # Scopes
    # default_scope { where("professors.name NOT LIKE '%INSTRUCTOR%' AND professors.name NOT LIKE '%INTRUCTOR%'") }

    # Bookmarks/Likes/Etc
    # has_many :like_by_users
end
