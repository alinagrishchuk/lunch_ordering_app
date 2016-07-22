class Product < ActiveRecord::Base
  enum course_type: { :'first course' => 1, :'main course' =>  2, :'drink' =>  3}
  has_many :menus

  validates :course_type, :name, presence: true
end
