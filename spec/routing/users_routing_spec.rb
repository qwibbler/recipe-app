require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #shopping_list' do
      expect(get: '/general_shopping_list').to route_to('users#shopping_list')
    end
  end
end
