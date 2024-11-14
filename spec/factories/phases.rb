FactoryBot.define do
  factory :phase do
    sequence(:name) { |n| "フェーズ#{n}" }
    display_order { 1 }
  end
end
