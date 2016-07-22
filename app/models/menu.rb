class Menu < ActiveRecord::Base
  belongs_to :product
  belongs_to :organization

  validates :price, :date_from, :date_to, :product, presence: true
  validates :price, :numericality => true,
                    :format => { :with => /\A\d{1,5}(\.\d{0,2})?\z/ }
end
