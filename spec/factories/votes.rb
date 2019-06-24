FactoryBot.define do
  factory :vote do
    vote_type { 1 }
    user { nil }
    review { nil }
  end
end
