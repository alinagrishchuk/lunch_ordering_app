class ApplicationController < ActionController::Base
  include AjaxHelper
  before_action :authenticate_user!

  protect_from_forgery with: :exception
end
