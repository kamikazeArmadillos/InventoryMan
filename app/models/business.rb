class Business < ActiveRecord::Base
  validates :name, :store_num, :phone, presence: true

  has_many :inventories
  has_many :user_businesses
  has_many :users, through: :user_businesses
end
