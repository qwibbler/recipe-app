require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before do
    @f1 = Food.create(name: 'Apple', measurement_unit: 'grams', price: 5)
    r1 = Recipe.create(name: 'Recipe 1', public: false, description: 'desc')
    @rf = RecipeFood.create(recipe: r1, food: @f1, quantity: 3)
  end

  it 'should return price' do
    expect(@rf.total_price).to eq(15)
  end
end
