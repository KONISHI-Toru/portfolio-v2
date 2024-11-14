FactoryBot.define do
  factory :tech_tag do
    tech_category { nil }
    sequence(:name) { |n| "タグ名#{n}" }
    display_order { 1 }
  end

  trait :with_category do
    tech_category { FactoryBot.create(:tech_category) }
  end
end
