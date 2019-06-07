module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld
    field :users, resolver: Queries::Users::Users
    field :user, resolver: Queries::Users::User
    field :all_links, resolver: Queries::Links::Links
    field :temporary_user, resolver: Queries::TemporaryUsers::TemporaryUser
  end
end
