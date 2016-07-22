class Organization < ActiveRecord::Base
  has_many :menus

  validates :name, presence: true
end
