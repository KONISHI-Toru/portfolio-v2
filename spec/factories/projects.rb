FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "プロジェクト#{n}" }
    target { "対象業種" }
    sequence(:overview) { |n| "プロジェクト#{n}の概要です。" }
    hw_configuration { "MyText" }
    sw_configuration { "MyText" }
    production_url { "MyString" }
    repository_url { "MyString" }
    from { "2024-06-19" }
    to { "2024-06-19" }
    user { nil }
    published { true }
  end
end
