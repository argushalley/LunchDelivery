class SideDish < ActiveRecord::Base
  has_many :order_side_dishes
  has_many :orders, through: :order_side_dishes

  validates :name, presence: true, uniqueness: true
end
