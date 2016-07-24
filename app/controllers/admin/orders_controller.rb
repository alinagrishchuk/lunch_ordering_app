class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    respond_to do |format|
      format.js do
        @orders_with_total =
            OrdersSummarizer.new(Order.find_by_day_full(params[:date]) )
      end
      format.html {}
    end
  end
end
