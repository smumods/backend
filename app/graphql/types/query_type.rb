module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld, cache: true
    if Rails.env.development? or Rails.env.staging?
      field :users, resolver: Queries::Users::Users
    end
    field :user, resolver: Queries::Users::User
    field :temporary_user, resolver: Queries::TemporaryUsers::TemporaryUser
    field :all_courses, resolver: Queries::Courses::Courses, cache: true
    field :course, resolver: Queries::Courses::Course
    field :all_professors, resolver: Queries::Professors::Professors, cache: true
    field :professor, resolver: Queries::Professors::Professor
    field :all_reviews, resolver: Queries::Reviews::Reviews, cache: true
    field :review, resolver: Queries::Reviews::Review
    field :search, resolver: Queries::Search, cache: true
    field :home_professors, resolver: Queries::Home::Professors, cache: true
    field :home_courses, resolver: Queries::Home::Courses, cache: true
    field :all_announcements, resolver: Queries::Announcements::Announcements
    field :all_books, resolver: Queries::Books::Books, cache: true
    field :book, resolver: Queries::Books::Book
  end
end
