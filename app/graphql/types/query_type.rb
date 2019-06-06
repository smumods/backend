module Types
  class QueryType < Types::BaseObject
    field :hello_world, resolver: Queries::HelloWorld
    field :users, resolver: Queries::Users
    field :user, resolver: Queries::User
    field :all_links, resolver: Queries::AllLinks
    field :temporary_user, resolver: Queries::TemporaryUser
  end
end
