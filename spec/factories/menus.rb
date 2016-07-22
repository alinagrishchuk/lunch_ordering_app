FactoryGirl.define do
  factory :menu do
    price "9.99"
    date_from "2016-07-22"
    date_to "2016-07-22"
    product
    organization nil
  end
end
