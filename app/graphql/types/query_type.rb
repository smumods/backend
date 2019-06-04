module Types
  class QueryType < Types::BaseObject
    
    # Hello World example 
    field :hello_world, String, null: false
    def hello_world
      "Hello Vera!"
    end
    
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
    field :temporary_user, Types::TemporaryUserType, null: false do
      argument :session_token, String, required: true
    end
    def temporary_user(session_token:)
      TemporaryUser.find_by_session_token(session_token)
    end
  end
end
