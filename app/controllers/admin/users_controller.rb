class Admin::UsersController < ApplicationController

  def index
    @users = User.all_except(current_user.id)
  end
end
