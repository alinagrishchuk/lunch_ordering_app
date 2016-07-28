class Admin::MenusController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @menus = Menu.find_by_day(Date.today).includes([:product,:organization])
    @menu = MenuFactory.new.build_menu
  end

  def create
    @menu = MenuFactory.new(menu_params).create_menu
  end

  private

  def menu_params
    params.require(:menu).permit(:course_type, :name, :price, :weekly, :organization_id )
  end
end
