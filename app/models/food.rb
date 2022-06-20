class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipes_foods
  has_many :inventories, through: :inventories_foods
end
