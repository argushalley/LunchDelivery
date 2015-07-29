class OrderMeat < ActiveRecord::Base
  belongs_to :meat
  belongs_to :order
end
