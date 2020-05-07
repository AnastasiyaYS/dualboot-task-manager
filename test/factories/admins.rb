# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    first_name { generate :string }
    last_name { generate :string }
    password { generate :string }
    email { generate :email }
  end
end
