require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe 'validation of price' do
    let(:menu) { build(:menu) }
    let(:invalid_price) { 123456.123 }
    let(:valid_price) { 12345.12 }

    it 'should be valid' do
      menu.price = valid_price
      expect(menu).to be_valid
    end

    it 'should be invalid' do
      menu.price = invalid_price
      expect(menu).not_to be_valid
    end
  end

  describe 'validation of price uniqueness' do
    let(:organization) {create(:organization)}
    let(:product) {create(:product)}

    let!(:period_menu) { create(:menu,date_from: Date.today,
                                date_to: Date.today.sunday,
                                organization: organization,
                                product: product) }

    let(:menu) { build(:menu,date_from: Date.tomorrow,
                       date_to: Date.tomorrow,
                       organization: organization,
                       product: product) }

    it 'should be invalid' do
      expect(menu).to be_invalid
      menu.date_from =  menu.date_to = Date.today.sunday
      expect(menu).to be_invalid
    end

    it 'should be valid' do
      menu.date_from =  menu.date_to = Date.today.sunday + 1.day
      expect(menu).to be_valid
    end
  end
end
