class RecipeFoodsController < ApplicationController
  FOODS = Food.distinct.pluck(:name)

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_foods_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Ingredient successfully added.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recipe.update(recipe_foods_params)
      redirect_to @recipe, notice: 'Ingredient successfully updated.'
    else
      flash.now[:error] = 'Ingredient was not updated.'
    end
  end

  private
  def recipe_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
