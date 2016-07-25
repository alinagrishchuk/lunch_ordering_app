require 'rails_helper'

RSpec.describe MenuFactory  do

  let!(:organization) { create(:organization) }
  let(:factory) { MenuFactory.new(menu) }
  let(:creating_a_menu) { -> { factory.create_menu } }
  let(:menu) { { course_type: 1,
                 name: 'new staff',
                 price: '3.3',
                 organization_id: organization.id,
                 weekly: '0' } }

  describe 'when product doesn\'t exist' do
      it 'should create menu' do
        expect(creating_a_menu).to change(Menu, :count).by(1)
      end

      it 'should create product' do
        expect(creating_a_menu).to change(Product, :count)
      end
    end

  describe 'when product exist' do
    let(:product) { create(:product) }
    let!(:menu)  { { course_type: product[:course_type].to_s,
                     name: product.name.to_s,
                     price: '3.3',
                     organization_id: organization.id,
                     weekly: '0' } }

    it 'should create menu' do
      expect(creating_a_menu).to change(Menu, :count).by(1)
    end

    it 'should not create product' do
      expect(creating_a_menu).not_to change(Product, :count)
    end

  end

  describe  'weekly menu' do
    let(:factory_menu) { factory.create_menu }

    it 'should create weekly menu' do
      menu[:weekly] = '1'

      expect(factory_menu.date_from).to eq(Date.today)
      expect(factory_menu.date_to).to eq(Date.today.sunday)
    end

    it 'should create day menu' do
      expect(factory_menu.date_from).to eq(Date.today)
      expect(factory_menu.date_to).to eq(Date.today)
    end
  end
end