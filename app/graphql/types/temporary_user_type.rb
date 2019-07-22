module Types
  class TemporaryUserType < Types::BaseObject
    field :client_verifier, String, null: false
    field :session_token, String, null: false
    field :telegram_id, String, null: true
    field :login_token, String, null: true
    field :action, String, null: true
    field :created_at, Types::DateTimeType, null: false
    field :updated_at, Types::DateTimeType, null: false
  end
end
