class Meat < ActiveRecord::Base
  before_destroy :check_for_orders

  has_many :order_meats
  has_many :orders, through: :order_meats

  validates :name, presence: true, uniqueness: true

  private

  def check_for_orders
    if orders.any?
      errors[:base] << "cannot delete meat that has already been ordered"
      return false
    end
  end
end
