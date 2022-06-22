class UsersController < ApplicationController
  # before_action :set_recipe

  def shopping_list
    @foods = current_user.foods
  end

  private

  # def set_recipe
  #   @recipe = Recipe.find(params[:recipe_id])
  # end

  # def recipe_foods_params
  #   params.require(:recipe_food).permit(:food_id, :quantity)
  # end
end
