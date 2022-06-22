class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def total_price
    food.price * quantity
  end
end
