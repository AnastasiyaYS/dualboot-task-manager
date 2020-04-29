FactoryBot.define do
  factory :task do
    sequence :name do |n|
      "Task#{n}"
    end

    sequence :description do |n|
      "task description #{n}"
    end

    state
    expired_at { Time.now + 6.month }

    trait :author do
      author
    end

    trait :assignee do
      assignee
    end
  end
end
