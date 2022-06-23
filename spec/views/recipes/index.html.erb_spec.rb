require 'rails_helper'

RSpec.describe 'recipes/index', type: :feature do
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit '/recipes'
  end

  it 'renders a list of recipes' do
    expect(page).to have_content('Recipe 1')
  end

  it 'has the navbar' do
    expect(page).to have_content('Recipe App')
  end

  it 'has button to add new recipe' do
    expect(page).to have_content('New recipe')
  end

  it 'when I click on new recipe button it redirects me new recipe page' do
    click_on 'New recipe'
    expect(current_path).to eq('/recipes/new')
  end
end
