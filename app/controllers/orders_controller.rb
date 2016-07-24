class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.
                           sort_by_date.
                           with_products
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      render ajax_redirect_to(orders_path)
    end
  end

  def order_params
    params.require(:order).
        permit(:date, :order_products_attributes => [:menu_id])
  end

end
