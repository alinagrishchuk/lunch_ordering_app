FactoryGirl.define do
  sequence(:name) { |n| "Google#{n}" }

  factory :organization do
    name
  end
end
