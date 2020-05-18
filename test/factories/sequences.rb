# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :name, aliases: [:first_name, :last_name] do |n|
    "Name #{n}"
  end

  sequence :string, aliases: [:description, :password] do |n|
    "String #{n}"
  end
end
