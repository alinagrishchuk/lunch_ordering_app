class MenusController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @menus = Menu.find_by_day(params[:date]).group_by_type

    @order = current_user.orders.build
    3.times { @order.order_products.build}

    @course_types = Product.course_types.invert
  end
end
