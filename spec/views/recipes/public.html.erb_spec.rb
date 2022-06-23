require 'rails_helper'

RSpec.describe 'recipes/public', type: :view do
  before(:each) do
    @recipes = assign(:recipes, Recipe.where(public: true).order(created_at: :desc))
    render
  end

  it 'renders public recipes name' do
    expect(rendered).to have_content('Recipe 2')
    expect(rendered).to have_content('Recipe 3')
  end

  it 'renders public recipes authors' do
    expect(rendered).to have_content('By John')
  end

  it 'renders public recipes total_ingredients' do
    expect(rendered).to have_content('Total Ingredients: 3')
    expect(rendered).to have_content('Total Ingredients: 2')
  end

  it 'renders public recipes total_prices' do
    expect(rendered).to have_content('Total Price: $24')
    expect(rendered).to have_content('Total Price: $18')
  end
end
