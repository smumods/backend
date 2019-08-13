module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld
    field :users, resolver: Queries::Users::Users
    field :user, resolver: Queries::Users::User
    field :temporary_user, resolver: Queries::TemporaryUsers::TemporaryUser
    field :all_courses, resolver: Queries::Courses::Courses
    field :course, resolver: Queries::Courses::Course
    field :all_professors, resolver: Queries::Professors::Professors
    field :professor, resolver: Queries::Professors::Professor
    field :all_reviews, resolver: Queries::Reviews::Reviews
    field :review, resolver: Queries::Reviews::Review
    field :search, resolver: Queries::Search
    field :home_professors, resolver: Queries::Home::Professors
    field :home_courses, resolver: Queries::Home::Courses
    field :all_announcements, resolver: Queries::Announcements::Announcements
    field :all_upcoming_events, resolver: Queries::Events::AllUpcomingEvents
    field :events_on_date, resolver: Queries::Events::EventsOnDate
    field :all_rsvp_events, resolver: Queries::Events::AllRsvpEvents
    field :event, resolver: Queries::Events::Event
    field :club, resolver: Queries::Clubs::Club
  end
end
