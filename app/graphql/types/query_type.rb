module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :all_links, [LinkType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end    

    def all_links
      Link.all
    end
  end
end
