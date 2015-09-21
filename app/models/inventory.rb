class Inventory < ActiveRecord::Base
  belongs_to :business

  validates :name, :count, presence: true
end
