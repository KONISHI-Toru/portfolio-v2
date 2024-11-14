FactoryBot.define do
  factory :profile do
    user { nil }
    name { "MyString" }
    introduction { "MyText" }
    published { true }
  end
end
