require 'rails_helper'

RSpec.describe '/general_shopping_list', type: :feature do
  describe 'for logged in users' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit general_shopping_list_path
    end

    it 'renders the header' do
      expect(page).to have_content('Recipe App')
    end

    it 'renders the total foods' do
      expect(page).to have_content('Amount of food items to buy: 2')
    end

    it 'renders the total price' do
      expect(page).to have_content('Total value of food needed: $33')
    end

    it 'renders a list of foods' do
      expect(page).to have_selector('table.foodIndex')
    end

    it 'renders the items' do
      expect(page).to have_content('Chicken 6 unit $2')
      expect(page).to have_content('Sugar 3 cups $7')
    end
  end

  describe 'for logged out users' do
    before do
      visit general_shopping_list_path
    end

    it 'renders the header' do
      expect(page).to have_content('Recipe App')
    end

    it 'renders the sorry page' do
      expect(page).to have_content('Sorry, you must log in to use this feature.')
    end
  end
end
