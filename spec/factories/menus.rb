FactoryGirl.define do
  factory :menu do
    price "9.99"
    date_from Date.today
    date_to Date.today
    product
    organization
  end
end
