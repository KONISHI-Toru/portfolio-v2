FactoryBot.define do
  factory :project do
    name { "MyString" }
    target { "MyString" }
    overview { "MyText" }
    hw_configuration { "MyText" }
    sw_configuration { "MyText" }
    production_url { "MyString" }
    repository_url { "MyString" }
    from { "2024-06-19" }
    to { "2024-06-19" }
    user { nil }
    published { false }
  end
end
