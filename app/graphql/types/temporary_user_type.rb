module Types
  class TemporaryUserType < Types::BaseObject
    field :id, ID, null: false # remove this later on to prevent anyone from knowing how many temporary users we have
    field :session_token, String, null: false
    field :telegram_id, String, null: true
    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false
  end
end
