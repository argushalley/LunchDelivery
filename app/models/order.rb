class Order < ActiveRecord::Base
  has_many :meats
  has_many :side_dishes
  has_one :address
end
