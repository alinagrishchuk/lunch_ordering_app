require 'rails_helper'

RSpec.describe MenusController, type: :controller do

  describe 'GET #index' do
    let!(:user) { create(:user) }
    let(:day) { Date.yesterday }
    let!(:menu) {create(:menu, date_from: day, date_to: day)}

    before(:each) do
      sign_in(user, :scope => :user)
    end

    it 'returns http success' do
      xhr :get, :index, date: day
      print response.body
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq 'text/javascript'
    end
  end

end
