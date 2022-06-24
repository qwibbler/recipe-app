require 'rails_helper'
RSpec.describe '/foods', type: :request do
  let(:valid_params) { { food: { name: 'apple', measurement_unit: 'unit', price: 15 } } }
  let(:invalid_params) { { food: { measurement_unit: 'unit', price: 15 } } }

  it 'renders correctly index' do
    get foods_path
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:index)
  end

  it 'renders correctly new' do
    get new_food_path
    expect(response).to have_http_status(:ok)
    expect(response).to render_template(:new)
  end

  describe 'Food / create' do
    before(:each) do
      post user_session_path,
           params: { 'user' => { 'email' => 'john@example.com', 'password' => 'password', 'remember_me' => '0' } }
    end
    context 'with valid parameters' do
      it 'food / create' do
        expect { post foods_path, params: valid_params }.to change(Food, :count).by(1)
      end

      it 'redirects to the root path after creating it' do
        expect(response).to redirect_to('/')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food' do
        expect { post foods_path, params: invalid_params }.to change(Food, :count).by(0)
      end
      it 'renders a response with 422 status' do
        post foods_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'food / delete' do
    before(:each) do
      post user_session_path,
           params: { 'user' => { 'email' => 'john@example.com', 'password' => 'password', 'remember_me' => '0' } }
    end
    it 'destroys the requested food' do
      post foods_path, params: valid_params
      food = Food.last
      expect { delete food_path(food.id) }.to change(Food, :count).by(-1)
    end
    it 'redirects to root' do
      post foods_path, params: valid_params
      food = Food.last
      delete food_path(food.id)
      expect(response).to redirect_to('/foods')
    end
  end
end
