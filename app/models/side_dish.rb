class SideDish < ActiveRecord::Base
  has_many :order_side_dishes
  has_many :orders, through: :order_side_dishes
end
