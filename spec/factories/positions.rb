FactoryBot.define do
  factory :position do
    sequence(:name) { |n| "役割#{n}" }
    display_order { 1 }
  end
end
