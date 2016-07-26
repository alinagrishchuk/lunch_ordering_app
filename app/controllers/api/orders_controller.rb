class Api::OrdersController < ApplicationController
  before_filter :restrict_access

  def index
    respond_to do |format|
      format.json do
        @orders = Order.find_by_day_full(Date.today)
      end
    end
  end

  private
    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end
end
