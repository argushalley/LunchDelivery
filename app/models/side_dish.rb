class SideDish < ActiveRecord::Base
  before_destroy :check_for_orders

  has_many :order_side_dishes
  has_many :orders, through: :order_side_dishes

  validates :name, presence: true, uniqueness: true

  private

  def check_for_orders
    if orders.any?
      errors[:base] << "cannot delete side dish that has already been ordered"
      return false
    end
  end
end
