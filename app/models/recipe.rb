class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def total_food
    recipe_foods.count
  end

  def total_price
    price = 0
    recipe_foods.each { |recipe_food| price += recipe_food.food.price * recipe_food.quantity }
    price
  end
end
