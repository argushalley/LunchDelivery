class CreateOrderSideDishes < ActiveRecord::Migration
  def change
    create_table :order_side_dishes do |t|
      t.references :side_dish, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
