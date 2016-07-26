require 'rails_helper'

RSpec.describe Api::OrdersController, type: :controller do
  let(:key) { create(:api_key) }

  describe "GET #index" do
    it "returns error with invalid key" do
      get :index, access_token: 'wrong key', format: :json
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns http success with valid key" do
      get :index, access_token: key.access_token, format: :json
      expect(response).to have_http_status(:success)
    end
  end

end
