class CreateInventoryFood < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.integer :quantity
      t.references :inventory, foreign_key: true, index: true
      t.references :food, foreign_key: true, index: true
      t.timestamps
    end
  end
end
