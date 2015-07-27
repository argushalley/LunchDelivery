class CreateSideDishes < ActiveRecord::Migration
  def change
    create_table :side_dishes do |t|
      t.integer :type, null: false
      t.timestamps null: false
    end
    add_index :side_dishes, :type
  end
end
