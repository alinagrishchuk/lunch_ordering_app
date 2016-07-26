class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :menus, through: :order_products

  accepts_nested_attributes_for :order_products,
                                 reject_if: lambda { |p| p[:menu_id].blank? }

  scope :with_products, -> { includes({  menus: [:product]  })}
  scope :with_user, -> { includes(:user) }
  scope :with_user_and_products, ->  { with_user.with_products }

  scope :sort_by_date, -> { order(date: :desc) }

  scope :find_by_day, ->(date) { where('date = ?', date) }
  scope :find_by_day_full, ->(date) { find_by_day(date).with_user_and_products }

  validates :user, :date, presence: true
  validates :order_products, presence: { message: 'Course must be present' }

end
