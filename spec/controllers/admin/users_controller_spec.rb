require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  describe "GET #index" do
    let!(:admin) { create(:admin) }
    let!(:user) { create(:user) }

    before(:each) do
      sign_in(admin, :scope => :user)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:users)).to include(user)
      expect(assigns(:users)).not_to include(admin)
    end
  end

end
