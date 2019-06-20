FactoryBot.define do
  factory :course do
    name { "MyString" }
    career { "MyString" }
    grading_basis { "MyString" }
    course_components { "MyString" }
    campus { "MyString" }
    academic_group { "MyString" }
    academic_organization { "MyString" }
    module_code { "MyString" }
    credit_units { 1.5 }
    description { "MyText" }
  end
end
