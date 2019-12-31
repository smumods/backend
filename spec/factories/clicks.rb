FactoryBot.define do
  factory :click do
    target_type { "MyString" }
    id_or_uuid { "MyString" }
    caller_id_or_uuid { "MyString" }
    additional_data { "MyText" }
  end
end
