require 'rails_helper'

RSpec.describe 'foods/index', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'renders a list of foods' do
    expect(page).to have_selector('table.foodIndex_table')
  end

  it 'renders the navbar' do
    expect(page).to have_content('Recipe App')
  end

  it 'when I click add food it redirects me to food new view' do
    click_on "Add food"
    expect(current_path).to eq('/foods/new')
  end
end
