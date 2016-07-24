FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@example.com" }

  factory :admin, class: User do
    email                 'admin@example.com'
    name                  'John Doe'
    password              'foobar12'
    password_confirmation 'foobar12'
  end

  factory :user do
    email
    name                  'John Doe'
    password              'foobar12'
    password_confirmation 'foobar12'

    before(:create) do
      if User.count == 0
        create(:admin)
      end
    end
  end

end
