class CreateOrderMeats < ActiveRecord::Migration
  def change
    create_table :order_meats do |t|
      t.references :meat, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
