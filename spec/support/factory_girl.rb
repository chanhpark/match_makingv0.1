require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name 'John'
    last_name 'Ko'
    birthday { Date.today - 19.years }
    zip_code '07650'
    password 'password'
    password_confirmation 'password'
  end

end
