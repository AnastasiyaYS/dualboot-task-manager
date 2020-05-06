FactoryBot.define do
  factory :manager do
    first_name { generate :string }
    last_name { generate :string }
    password { generate :string }
    email { generate :email }
  end
end
