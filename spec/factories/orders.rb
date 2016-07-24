FactoryGirl.define do
  factory :order do
    date  Date.today
    user

    factory :order_for_menu do
      transient do
        menu nil
      end

      before(:create) do |order, evaluator|
        order.order_products << build(:order_product, menu: (evaluator.menu))
      end
    end

  end
end
