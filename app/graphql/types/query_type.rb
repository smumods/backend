module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld
    field :users, resolver: Queries::Users::Users
    field :user, resolver: Queries::Users::User
    field :all_links, resolver: Queries::Links::Links
    field :temporary_user, resolver: Queries::TemporaryUsers::TemporaryUser
    field :all_courses, resolver: Queries::Courses::Courses
    field :course, resolver: Queries::Courses::Course
    field :all_professors, resolver: Queries::Professors::Professors
  end
end
