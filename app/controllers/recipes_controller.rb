class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to recipes_path, notice: 'Recipe was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
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

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    defaults = { user_id: current_user.id }
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id).merge(defaults)
  end
end
