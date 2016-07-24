class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products, dependent: :destroy
  accepts_nested_attributes_for :order_products,
                                 reject_if: lambda { |p| p[:menu_id].blank? }

  scope :with_products, -> { includes({ order_products: [{ menu: [:product] }] }) }
  scope :sort_by_date, -> { order(date: :desc) }

  validates :user, :date, presence: true
  validates :order_products, presence: { message: 'Course must be present' }
end
