class User < ActiveRecord::Base
  has_many :user_businesses
  has_many :businesses, through: :user_businesses

  validates :email, :f_name, :phone, :level, :password_digest, presence: true
end
