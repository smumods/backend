FactoryBot.define do
  factory :review do
    professor_review { "MyText" }
    module_review { "MyText" }
    is_anonymous { false }
    marking_score { 1 }
    engagement_score { 1 }
    fairness_score { 1 }
    workload_score { 1 }
    user { nil }
    professor { nil }
    course { nil }
  end
end
