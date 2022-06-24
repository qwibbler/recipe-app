require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid' do
    recipe = Recipe.create(name: 'pay', description: 'delicious dessert', user_id: User.first.id)
    expect(recipe).to be_valid
  end

  it 'validates name presence' do
    recipe = Recipe.create(description: 'delicious dessert', user_id: User.first.id)
    expect(recipe).to_not be_valid
  end

  it 'validates description presence' do
    recipe = Recipe.create(name: 'pay', user_id: User.first.id)
    expect(recipe).to_not be_valid
  end
end
