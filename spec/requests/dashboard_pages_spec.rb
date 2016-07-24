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

    it 'should display message for empty menu' do
      first('td.fc-day.fc-past').click
      sleep 3
      should have_content('Menu is empty')
    end
  end

  describe 'order creating', js: true do
    let(:day) { Date.today }
    let!(:menu) {create(:menu, date_from: day, date_to: day)}
    let(:product_type) { menu.course_type }
    let(:product_name) { menu.name }
    before do
      find('td.fc-day.fc-today').click
      sleep 3
    end

    it 'should create order' do
      select_from_chosen(product_name, {from: product_type})
      click_button 'Create Order'
      sleep 3
      should have_content('My orders')
      should have_content(product_name)
    end

    it 'should not create empty order' do
      click_button 'Create Order'
      sleep 3
      should have_content('Course must be present')
    end

  end
end