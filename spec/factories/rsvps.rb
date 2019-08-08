FactoryBot.define do
  factory :rsvp do
    user { nil }
    event { nil }
    paid { false }
  end
end
