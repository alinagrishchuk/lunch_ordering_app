Order.destroy_all
Menu.destroy_all
Product.destroy_all
User.destroy_all

100.times do |i|
  Product.create(
             name: Faker::Commerce.product_name,
             course_type: rand(1..3)
  )
end

Date.today.downto(Date.today - 40.days) do |day|
  products = Product.order('RANDOM()').limit(10)
  products.each do |product|
    Menu.create(
            price: Faker::Commerce.price,
            date_from: day,
            date_to: day,
            product: product
    )
  end
end

primary_user = User.create!({ email:                  'test@example.com',
                              password:               'test@example.com',
                              password_confirmation:  'test@example.com',
                              name:                    Faker::Name.name
                            })


10.times do |i|
  email =  Faker::Internet.user_name + i.to_s +
      "@#{Faker::Internet.domain_name}"

  User.create!({ email:                  email,
                 password:               'test@example.com',
                 password_confirmation:  'test@example.com',
                 name:                    Faker::Name.name,
               })

end


Date.today.downto(Date.today - 40.days) do |day|
  5.times do
    menu = Menu.order('RANDOM()').first
    user = User.order('RANDOM()').first
    order = Order.new(date: day, user: user)
    order.order_products << OrderProduct.new(menu: menu)
    order.save!
  end
end