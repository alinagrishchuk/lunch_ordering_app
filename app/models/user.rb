class User < ActiveRecord::Base
  has_many :orders

  scope :all_except, ->(user_id) { where.not(id: user_id) }

  validates :name, presence: true

  before_create do
    self.admin = true if User.count == 0
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
