FactoryGirl.define do
  factory :order do
    date  Date.today
    user
  end
end
