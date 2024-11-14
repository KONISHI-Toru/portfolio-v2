FactoryBot.define do
  factory :tech_category do
    parent { nil }
    sequence(:name) { |n| "カテゴリ名#{n}" }
    display_order { 1 }
  end
end
