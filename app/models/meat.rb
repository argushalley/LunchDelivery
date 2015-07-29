class Meat < ActiveRecord::Base
  has_many :order_meats
  has_many :orders, through: :order_meats

  validates :name, presence: true, uniqueness: true
end
