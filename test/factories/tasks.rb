# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name
    description
    expired_at { Time.now + 6.month }
    author factory: :manager
    assignee factory: :developer
  end
end
