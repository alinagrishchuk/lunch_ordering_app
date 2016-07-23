require 'rails_helper'

describe 'Dashboard page', :type => :request do
  subject { page }
  let!(:user) { create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
    visit root_path
  end

  describe 'show menus by date', js: true do
    let(:day) { Date.today }
    let!(:menu) {create(:menu, date_from: day, date_to: day)}

    it 'should display menu list for today' do
      find('td.fc-day.fc-today').click
      sleep 3
      should have_selector('div#menu-modal')
      should have_content(menu.product.name)
    end

    it 'should not display menu for future' do
      first('td.fc-future.fc-day').click
      sleep 3
      should_not have_selector('div#menu-modal')
    end
  end
end