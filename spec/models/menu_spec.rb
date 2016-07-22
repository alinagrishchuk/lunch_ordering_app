require 'rails_helper'

RSpec.describe Menu, type: :model do

  describe 'validate price' do
    let(:menu) {create(:menu) }
    let(:invalid_price) { 123456.123 }
    let(:valid_price) { 12345.12 }

    it 'should be invalid' do
      menu.price = invalid_price
      expect(menu).not_to be_valid
    end

    it 'should be valid' do
      menu.price = valid_price
      expect(menu).to be_valid
    end
  end

end
