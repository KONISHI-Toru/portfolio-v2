FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password123" }
    available { true }

    trait :not_available do
      available { false }
    end

    trait :published do
      # association :profile, factory: :profile
      after(:create) do |user|
        user.profile = FactoryBot.create(
          :profile,
          user: user
        )
      end
    end
  end
end
