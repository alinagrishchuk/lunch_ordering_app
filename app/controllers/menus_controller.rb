class MenusController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @menus = Menu.by_day(params[:date]).includes(:product)
  end
end
