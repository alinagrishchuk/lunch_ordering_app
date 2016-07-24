class Menu < ActiveRecord::Base
  belongs_to :product
  belongs_to :organization

  delegate :name,         :to => :product
  delegate :course_type,  :to => :product
  delegate :full_name,    :to => :product

  validates :price, :date_from, :date_to, :product, presence: true
  validates :price, :numericality => true,
                    :format => { :with => /\A\d{1,5}(\.\d{0,2})?\z/ }

  scope :find_by_day, ->(date) { where("date_from <= :date and date_to >= :date", date: date) }
  scope :group_by_type, -> { includes(:product).group_by { |menu| menu.course_type } }

end
