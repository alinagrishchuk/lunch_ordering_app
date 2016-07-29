require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do
    let!(:user) { create(:user) }

    before(:each) do
      sign_in(user, :scope => :user)
    end

    it "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

end
