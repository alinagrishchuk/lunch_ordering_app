class ApplicationController < ActionController::Base
  include AjaxHelper

  protect_from_forgery with: :exception

end
