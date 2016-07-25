class Product < ActiveRecord::Base
  enum course_type: { :'first course' => 0, :'main course' =>  1, :'drink' =>  2}
  has_many :menus

  validates :course_type, :name, presence: true
  validates :name, uniqueness: true

  scope :simpled, ->{  select(:name,:course_type).map{ |product|  {value: product[:course_type], label:  product.name } }}
  scope :simpled_search, -> (term,limit) { search(term).limit(limit).simpled }

  def full_name
    "#{name}, #{course_type}"
  end

  def self.search term
    where('name like ?',"%#{term}%").
        order("similarity(name, #{ActiveRecord::Base.sanitize(term)}) DESC")
  end

  before_save do
    self.name.downcase!
  end
end
