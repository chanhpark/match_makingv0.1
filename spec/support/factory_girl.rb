require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :profile do
    user
    first_name 'John'
    last_name 'Ko'
    birthday { Date.today - 19.years }
    zip_code '07650'
  end
end
