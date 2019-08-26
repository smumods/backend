FactoryBot.define do
  factory :unrsvp do
    user { nil }
    event { nil }
    paid { false }
    status { "MyString" }
  end
end
