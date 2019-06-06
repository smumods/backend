module Types
  class QueryType < Types::BaseObject

    field :hello_world, resolver: Queries::HelloWorld
    
    # All Users
    field :users, [Types::UserType], null: false
    def users
      User.all
    end
    
    # Individual User
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    
    def user(id:)
      User.find(id) 
    end    
    
    # All Links
    field :all_links, [LinkType], null: false
    def all_links
      Link.all
    end

    # TemporaryUser
    field :temporary_user, String, null: false do
      argument :client_verifier, String, required: true
    end
    def temporary_user(client_verifier:)
      TemporaryUser.find_by_client_verifier(client_verifier)
    end
  end
end
