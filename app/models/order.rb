class Order < ActiveRecord::Base
  has_many :order_meats, dependent: :destroy
  has_many :meats, through: :order_meats
  has_many :order_side_dishes, dependent: :destroy
  has_many :side_dishes, through: :order_side_dishes
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :meats
  accepts_nested_attributes_for :side_dishes
  accepts_nested_attributes_for :address

  validates_presence_of :address, :meats, :side_dishes
end
