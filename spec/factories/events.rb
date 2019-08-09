FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyText" }
    main_image { "MyString" }
    gallery { "MyText" }
    color { "MyString" }
    start_date { "2019-08-06 17:16:05" }
    end_date { "2019-08-06 17:16:05" }
    location { "MyString" }
    price { 1.5 }
    require_rsvp { false }
    rsvp_by { "2019-08-06 17:16:05" }
    club { nil }
  end
end
