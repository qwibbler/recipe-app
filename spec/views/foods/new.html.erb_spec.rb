require 'rails_helper'

RSpec.describe 'foods/new', type: :feature do
  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit '/foods/new'
  end

  it 'renders new food form' do
   expect(page).to have_selector('form.foodNew_form')
  end

  it 'renders navbar' do
    expect(page).to have_content('Recipe App')
  end

 it 'take me back to foods index' do
    click_on "Back to foods"
    expect(current_path).to eq('/foods') 
 end
end
