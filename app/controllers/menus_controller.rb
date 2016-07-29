class MenusController < ApplicationController
  before_action :build_order, only: [:index]
  respond_to :js

  def index
    @menus = Menu.find_and_group(params[:date])
  end

  private
    def build_order
      @order = current_user.orders.build
      3.times { @order.order_products.build}

      @course_types = Product.course_types.invert
    end
end
