class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_businesses
  has_many :businesses, through: :user_businesses

  validates :email, :encrypted_password, presence: true
  validates :password, presence: true, if: "id.nil?"
end
