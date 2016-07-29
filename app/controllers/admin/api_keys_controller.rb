class Admin::ApiKeysController < ApplicationController

  def index
    @api_keys = ApiKey.all
  end

  def create
    ApiKey.create
    redirect_to admin_api_keys_path
  end

  def destroy
    ApiKey.find(params[:id]).destroy
    redirect_to admin_api_keys_path
  end
end
