class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :inventories

  def missing_foods_qt
    RecipeFood.includes(:food).where(recipe: recipes).where.not(food: foods)
      .group(:food).sum(:quantity)
  end
end
