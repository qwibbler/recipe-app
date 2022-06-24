require 'rails_helper'

RSpec.describe FoodsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/foods').to route_to('foods#index')
    end

    it 'routes to #new' do
      expect(get: '/foods/new').to route_to('foods#new')
    end

    it 'routes to #create' do
      expect(post: '/foods').to route_to('foods#create')
    end
  end
end
