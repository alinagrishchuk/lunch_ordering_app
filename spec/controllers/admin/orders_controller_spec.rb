require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  describe "GET #index" do
    let!(:admin) { create(:admin) }

    before(:each) do
      sign_in(admin, :scope => :user)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
