require 'rails_helper'

RSpec.describe Admin::ApiKeysController, type: :controller do

  let!(:admin) { create(:admin) }
  before(:each) do
    sign_in(admin, :scope => :user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "create key redirect to #index" do
      expect{ post :create }.to change{ ApiKey.count }
      expect(response).to redirect_to(admin_api_keys_path)
    end
  end

end
