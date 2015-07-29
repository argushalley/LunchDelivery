class CreateMeats < ActiveRecord::Migration
  def change
    create_table :meats do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :meats, :name
  end
end
