require 'rails_helper'

describe 'Admin scope pages', :type => :request do
  subject { page }
  let!(:admin) { create(:admin) }

  before(:each) do
    login_as(admin, :scope => :user)
    visit root_path
  end

  describe 'orders page' do
    describe 'show orders by date', js: true do
      before { visit admin_orders_path}

      let!(:menu) { create(:menu) }
      let!(:order) {create(:order_for_menu, menu: menu )}

      it 'should display orders list & price for today' do
        find('td.fc-day.fc-today').click
        sleep 2
        should have_selector('div#menu-modal')
        should have_content(menu.name)
        should have_content(" Total launch cost is... #{menu.price}")
      end

      it 'should not display order for future' do
        first('td.fc-future.fc-day').click
        sleep 2
        should_not have_selector('div#menu-modal')
      end

      it 'should display message for empty menu' do
        first('td.fc-day.fc-past').click
        sleep 2
        should have_content('Orders are not exist!')
      end

    end
  end

  describe 'menus page', js: true do
    let(:organization) { create(:organization) }

    let!(:product) { create(:product,name: 'coca-cola') }
    let!(:menu){ create(:menu, product: product, organization: organization) }

    before { visit admin_menus_path }

    describe 'menu creation' do
      let(:name) { 'new product' }
      let(:price) { '9.99' }

      it 'should create menu for exist product' do
        fill_in 'Price', with: price
        init_and_click_typehead_search('menu_name','coca')

        expect(page).to have_select('menu_course_type', selected: product.course_type)
        submit_form

        should have_selector('#menu_name', text: '')
        within ".menus" do
          should have_content(product.name)
          should have_content(price)
        end
      end

      it 'should create menu for non exist product' do
        fill_in 'Name', with: name
        fill_in 'Price', with: price

        submit_form

        should have_selector('#menu_name', text: '')
        within ".menus" do
          should have_content(name)
          should have_content(price)
        end
      end


      it 'should show validation errors' do
        fill_in 'Price', with: price
        init_and_click_typehead_search('menu_name', product.name)
        select organization.name, :from => 'menu_organization_id'
        submit_form
        should have_content('Price already exist')
      end
    end
  end

end