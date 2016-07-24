require 'rails_helper'

describe 'Admin scope pages', :type => :request do
  subject { page }
  let!(:admin) { create(:admin) }

  before(:each) do
    login_as(admin, :scope => :user)
    visit root_path
  end

  describe 'show orders by date', js: true do
    before { visit admin_orders_path}
    let(:day) { Date.today }

    let!(:product) { create(:product,name: 'coca-cola') }
    let!(:menu) { create(:menu, product: product) }

    let!(:order) {create(:order_for_menu, menu: menu )}


    it 'should display orders list & price for today' do
      find('td.fc-day.fc-today').click
      sleep 3
      should have_selector('div#menu-modal')
      should have_content(menu.name)
      should have_content(" Total launch cost is... #{menu.price}")
    end

    it 'should not display order for future' do
      first('td.fc-future.fc-day').click
      sleep 3
      should_not have_selector('div#menu-modal')
    end

    it 'should display message for empty menu' do
      first('td.fc-day.fc-past').click
      sleep 3
      should have_content('Orders are not exist!')
    end

  end
end