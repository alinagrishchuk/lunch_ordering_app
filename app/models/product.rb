class Product < ActiveRecord::Base
  enum course_type: { :'first course' => 0, :'main course' =>  1, :'drink' =>  2}
  has_many :menus

  validates :course_type, :name, presence: true

  def full_name
    "#{name}, #{course_type}"
  end
end
