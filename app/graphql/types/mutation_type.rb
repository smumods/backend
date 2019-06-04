module Types
  class MutationType < BaseObject
    field :create_link, mutation: Mutations::CreateLink
    field :create_user, mutation: Mutations::Users::CreateUser
    field :create_temporary_user, mutation: Mutations::Users::CreateTemporaryUser
  end
end
