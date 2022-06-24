class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipe, foreign_key: true, index: true
      t.references :food, foreign_key: true, index: true
      t.timestamps
    end
  end
end
