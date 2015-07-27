class AddOrderRefToMeats < ActiveRecord::Migration
  def change
    add_reference :meats, :order, index: true, foreign_key: true
  end
end
