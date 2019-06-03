module Types
  class MutationType < BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :create_user, mutation: Mutations::CreateUser
    field :log_in_user, mutation: Mutations::LogInUser
    field :create_temporary_user, mutation: Mutations::CreateTemporaryUser
  end
end
