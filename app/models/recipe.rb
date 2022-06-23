class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :description, presence: true

  def total_food
    recipe_foods.size
  end

  def total_price
    price = 0
    recipe_foods.each { |recipe_food| price += recipe_food.total_price }
    price
  end
end
