require 'rails_helper'

RSpec.describe 'recipes/new', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit '/recipes/new'
  end

  it 'renders new recipe form' do
    expect(page).to have_selector('form')
  end

  it 'renders navbar' do
    expect(page).to have_content('Recipe App')
  end

  it 'returns me to recipe index' do
    click_on 'Back to recipes'
    expect(current_path).to eq('/recipes')
  end
end
