FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "FirstName#{n}"
    end

    sequence :last_name do |n|
      "LastName#{n}"
    end

    sequence :password do |n|
      "password#{n}"
    end

    sequence :email do |n|
      "person#{n}@example.com"
    end

    avatar
    type
  end
end
