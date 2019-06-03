module Types
  class TemporaryUserType < Types::BaseObject
    field :id, ID, null: false # remove this later on to prevent anyone from knowing how many temporary users we have
    field :session_token, String, null: false
    field :telegram_id, String, null: true
  end
end
