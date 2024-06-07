FactoryBot.define do
  factory :profile do
    user { nil }
    name { "MyString" }
    introduction { "MyText" }
    published { false }
  end
end
