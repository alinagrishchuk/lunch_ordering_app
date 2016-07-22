Menu.destroy_all
Product.destroy_all

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
