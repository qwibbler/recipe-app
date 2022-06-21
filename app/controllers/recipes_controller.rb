class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      flash.now[:notice] = 'Recipe was successfully updated.'
    else
      flash.now[:error] = 'Recipe was not updated.'
    end
  end

  def destroy
    @recipe.destroy

    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  def public
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:public)
  end
end
