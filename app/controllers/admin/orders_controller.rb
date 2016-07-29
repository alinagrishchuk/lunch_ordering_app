class Admin::OrdersController < ApplicationController
  respond_to :js

  def index
    respond_to do |format|
      format.js do
        @orders_with_total = OrdersSummarizer.new(params[:date])
      end
      format.html {}
    end
  end
end
