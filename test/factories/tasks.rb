# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { generate :string }
    description { generate :string }
    state {}
    expired_at { Time.now + 6.month }

    trait :author do
      author
    end

    trait :assignee do
      assignee
    end
  end
end
