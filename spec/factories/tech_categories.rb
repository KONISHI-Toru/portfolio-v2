FactoryBot.define do
  factory :tech_category do
    parent { nil }
    name { "MyString" }
    display_order { 1 }
  end
end
