class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[new create update destroy]

  def new
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe_food = @recipe.recipe_foods.new(recipe_foods_params)

    if @recipe_food.save
      redirect_to recipe_url(@recipe), notice: 'Ingredient successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe.update(recipe_foods_params)
      redirect_to @recipe, notice: 'Ingredient successfully updated.'
    else
      flash.now[:error] = 'Ingredient was not updated.'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
