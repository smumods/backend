FactoryBot.define do
  factory :club_member do
    user { nil }
    club { nil }
    status { 1 }
    notes { "MyString" }
  end
end
