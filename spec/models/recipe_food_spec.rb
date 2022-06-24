require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'should return price' do
    expect(RecipeFood.first.total_price).to eq(6)
  end
end
