json.array! @orders do |order|
  json.id order.id
  json.date order.date
  json.name order.user.name
  json.email order.user.email

  json.order_products order.menus do |menu|
    json.type menu.course_type
    json.name menu.name
    json.price menu.price
  end
end