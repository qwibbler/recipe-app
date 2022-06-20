class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  UNITS = ["teaspoon", "tablespoon", "cup", "ounce", "pound", "kilogram", "gram", "mililiter", "liter", "miligram","units"].sort

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

      if @food.save
        redirect_to foods_path, notice: 'Food was successfully created.'
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /foods/1 or /foods/1.json

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully destroyed.' 
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    defaults = {user_id: current_user.id}
    params.require(:food).permit(:name, :measurement_unit, :price, :user_id).merge(defaults)
  end
end
