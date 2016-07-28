class Menu < ActiveRecord::Base
  belongs_to :product
  belongs_to :organization

  attr_writer :weekly

  accepts_nested_attributes_for :product

  delegate :name,         :to => :product
  delegate :course_type,  :to => :product
  delegate :full_name,    :to => :product

  validates :price, :date_from, :date_to, :product, :organization_id, presence: true
  validates :price, :numericality => true,
                    :format => { :with => /\A\d{1,5}(\.\d{0,2})?\z/ }
  validate :uniqueness_product_price

  scope :find_by_day, ->(date) { where("date_from <= :date and date_to >= :date", date: date) }
  scope :group_by_type, -> { includes(:product).group_by { |menu| menu.course_type } }
  scope :find_and_group, ->(date) {find_by_day(date).group_by_type }

  def weekly
    self.date_from != self.date_to
  end

  def uniqueness_product_price
    (date_from..date_to).each do |day|
      errors.add(:price, "already exists for #{day}") unless Menu.uniqueness?(self,day)
    end
  end

  def self.uniqueness? (menu,day)
    where(product_id: menu.product_id).
        where(organization_id: menu.organization_id).
        find_by_day(day).count == 0
  end

end

