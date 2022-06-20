module FoodsHelper
  def total_foods(recipe)
    recipe.foods.count
end
