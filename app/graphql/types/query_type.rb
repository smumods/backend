module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld
    if Rails.env.development? or Rails.env.staging?
      field :users, resolver: Queries::Users::Users
    end
    field :user, resolver: Queries::Users::User
    field :temporary_user, resolver: Queries::TemporaryUsers::TemporaryUser
    field :all_courses, resolver: Queries::Courses::Courses
    field :course, resolver: Queries::Courses::Course
    field :all_professors, resolver: Queries::Professors::Professors
    field :professor, resolver: Queries::Professors::Professor
    field :all_reviews, resolver: Queries::Reviews::Reviews
    field :review, resolver: Queries::Reviews::Review
    field :home_professors, resolver: Queries::Home::Professors
    field :home_courses, resolver: Queries::Home::Courses
    field :all_announcements, resolver: Queries::Announcements::Announcements
    field :all_books, resolver: Queries::Books::Books
    field :book, resolver: Queries::Books::Book
  end
end
