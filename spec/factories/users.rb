FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@example.com" }

  factory :user do
    email
    name                  'John Doe'
    password              'foobar12'
    password_confirmation 'foobar12'
  end
end
