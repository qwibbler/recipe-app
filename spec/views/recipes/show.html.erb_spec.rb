require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  before do
    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit recipe_path(id: 1)
  end

  describe 'private recipe for logged in users' do
    it 'renders the header' do
      expect(page).to have_content('Recipe App')
    end

    it 'renders the recipe' do
      expect(page).to have_content('Recipe 1')
    end

    it 'renders the public switch' do
      expect(page).to have_content('Public')
    end

    it "the public switch switches the recipe's public column" do
      check 'recipe_public'
      expect(Recipe.first.public).to be(false)
    end

    it 'renders the preparation_time' do
      expect(page).to have_content('Preparation time: 7 hours')
    end

    it 'renders the cooking_time' do
      expect(page).to have_content('Cooking time: N/A')
    end

    it 'renders the steps' do
      expect(page).to have_content('Lorem ipsum dolor sit amet')
      expect(page).to have_content('labore et dolore magna aliqua.')
    end

    it 'renders the link to add ingredients' do
      expect(page).to have_link('Add Ingredient')
    end

    it 'redirects to recipe_food new view' do
      click_on 'Add Ingredient'
      expect(current_path).to eq('/recipes/1/recipe_foods/new')
    end

    it 'renders the ingredients' do
      expect(page).to have_content('Chicken 3 unit $6')
      expect(page).to have_content('Sugar 3 cups $21')
    end

    it 'renders the actions' do
      expect(page).to have_button('Modify')
      expect(page).to have_button('Delete')
    end

    it 'renders the delete recipe button' do
      expect(page).to have_button('Delete Recipe')
    end
  end
end

RSpec.describe 'recipes/show', type: :feature do
  before do
    visit recipe_path(id: 1)
  end

  describe 'private recipe for logged out users' do
    it 'does not render recipe' do
      expect(page).to have_content('Sorry, this recipe is not available for you!')
    end
  end
end

RSpec.describe 'recipes/show', type: :feature do
  before do
    visit recipe_path(id: 2)
  end

  describe 'private recipe for logged out users' do
    it 'renders the header' do
      expect(page).to have_content('Recipe App')
    end

    it 'renders the recipe' do
      expect(page).to have_content('Recipe 2')
    end

    it 'does not render the public switch' do
      expect(page).to_not have_field("input[type='checkbox']")
    end

    it 'renders the details' do
      expect(page).to have_content('Preparation time: 7 hours')
      expect(page).to have_content('Cooking time: 8 hours')
      expect(page).to have_content('Lorem ipsum dolor sit amet')
      expect(page).to have_content('labore et dolore magna aliqua.')
    end

    it 'does not render the link to add ingredients' do
      expect(page).to_not have_link('Add Ingredient')
    end

    it 'renders the ingredients' do
      expect(page).to have_content('Apple 3 grams $15')
      expect(page).to have_content('Pineapple 3 grams $3')
    end

    it 'does not render the actions' do
      expect(page).to_not have_button('Modify')
      expect(page).to_not have_button('Delete')
    end

    it 'does not render the delete recipe button' do
      expect(page).to_not have_button('Delete Recipe')
    end
  end
end
