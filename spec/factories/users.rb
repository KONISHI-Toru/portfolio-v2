FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    available { true }

    trait :not_available do
      available { false }
    end
  end
end
