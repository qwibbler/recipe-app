require 'rails_helper'
RSpec.describe '/recipes', type: :request do
  let(:valid_params){{recipe: {name: 'Apple pay', description: 'Delicious dessert'}}}
  let(:invalid_params){{recipe: {description: 'Delicious dessert'}}}
  before(:each) {post user_session_path, params: {"user"=>{"email"=>"john@example.com", "password"=>"password", "remember_me"=>"0"}}}
  it 'renders correctly index' do
    get recipes_path
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end
  
  it 'renders correctly new' do
    get new_recipe_path
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  describe 'recipes / create' do
    context 'with valid parameters' do
      it 'recipe create' do
        expect {post recipes_path, params: valid_params}.to change(Recipe, :count).by(1)
      end
      it 'redirects to recipes index' do
        expect(response).to redirect_to('/')
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new recipe' do
        expect {post recipes_path, params: invalid_params}.to change(Recipe, :count).by(0)  
      end
      it 'renders a response with 422 status' do
        post recipes_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'recipe delete' do
    it 'destroys the requested recipe' do
      post recipes_path, params: valid_params
      recipe = Recipe.last
      expect {delete recipe_path(recipe.id)}.to change(Recipe, :count).by(-1)
    end
    it 'redirects to root' do
      post recipes_path, params: valid_params
      recipe = Recipe.last
      delete recipe_path(recipe.id)
      expect(response).to redirect_to('/recipes')
    end
  end
end
