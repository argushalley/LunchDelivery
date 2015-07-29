class Order < ActiveRecord::Base
  has_many :meats
  has_many :side_dishes
  has_one :address

  accepts_nested_attributes_for :meats
end
