class CreateMeats < ActiveRecord::Migration
  def change
    create_table :meats do |t|
      t.integer :type, null: false
      t.timestamps null: false
    end
    add_index :meats, :type
  end
end
