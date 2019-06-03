FactoryBot.define do
  factory :temporary_user do
    ip_address { "MyString" }
    session_token { "MyString" }
    telegram_verified { false }
  end
end
