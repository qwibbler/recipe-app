class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.time :preparation_time
      t.time :cooking_time
      t.string :description
      t.boolean :public
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
