FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  sequence :string do |n|
    "string#{n}"
  end
end
