class OrderSideDish < ActiveRecord::Base
  belongs_to :side_dish
  belongs_to :order
end
