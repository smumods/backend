module Types
    class VoteType < Types::BaseObject
        field :id, ID, null: false
        field :vote_type, Int, null: false
        field :review_type, String, null: false
        field :user, Types::UserType, null: false
        field :review, Types::ReviewType, null: false
        field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false
    end
end
