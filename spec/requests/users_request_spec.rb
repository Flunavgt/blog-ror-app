require_relative '../rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a 200 OK status' do
      get 'http://localhost:3000/users'
      expect(response.status).to eq(200)
    end

    it 'checks if the correct themplate was rendered' do
      get 'http://localhost:3000/users'
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes correct placeholder text' do
      get 'http://localhost:3000/users'
      expect(response.body).to include('All users list')
    end
  end
end
