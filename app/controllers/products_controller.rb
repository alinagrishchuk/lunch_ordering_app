class ProductsController < ApplicationController
  respond_to :js

  def index
    search = params[:search]
    render json:
      Product.simpled_search(search, 10)
  end
end
