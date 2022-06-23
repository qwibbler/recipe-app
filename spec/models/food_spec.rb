require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid' do
    food =  Food.new(name:'pay', measurement_unit: 'grams', price:15, user_id: 1)
    expect(food).to be_valid
  end

  it 'validates name presence' do
    food =  Food.new(measurement_unit: 'grams', price:15, user_id: 1)
    expect(food).to_not be_valid
  end

  it 'validates measurement_unit presence' do
    food =  Food.new(name:'pay', price:'15', user_id: 1)
    expect(food).to_not be_valid
  end

  it 'validates price presence' do
    food =  Food.new(name:'pay', measurement_unit: 'grams', user_id: 1)
    expect(food).to_not be_valid
  end

  it 'validates price is greater than 0' do
    food =  Food.new(name:'pay', measurement_unit: 'grams', user_id: 1)
    food.price = -1
    expect(food).to_not be_valid
  end
end
