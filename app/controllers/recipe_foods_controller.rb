class RecipeFoodsController < ApplicationController
  before_action :set_recipe

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

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_foods_params)
      redirect_to @recipe, notice: 'Ingredient successfully updated.'
    else
      flash.now[:error] = 'Ingredient was not updated.'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
