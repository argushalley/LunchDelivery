class AddOrderRefToSideDishes < ActiveRecord::Migration
  def change
    add_reference :side_dishes, :order, index: true, foreign_key: true
  end
end
