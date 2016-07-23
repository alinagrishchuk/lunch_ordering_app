class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products, dependent: :destroy

  validates :user, :date, presence: true
end
