FactoryBot.define do
  factory :tech_tag do
    tech_category { nil }
    name { "MyString" }
    display_order { 1 }
  end
end
