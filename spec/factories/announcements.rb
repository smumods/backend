FactoryBot.define do
  factory :announcement do
    valid_from { "2019-07-15 15:58:09" }
    expires_on { "2019-07-15 15:58:09" }
    main_image { "MyString" }
    additional_images { "MyText" }
    title { "MyString" }
    description { "MyText" }
  end
end
