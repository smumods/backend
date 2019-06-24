module Types
    class VoteType < Types::BaseObject
        field :vote_type, Int, null: false
        field :review_type, String, null: false
        field :user_id, Types::UserType, null: false
        field :review_id, Types::ReviewType, null: false
        field :created_at, Types::DateTimeType, null: false
        field :updated_at, Types::DateTimeType, null: false
    end
end
