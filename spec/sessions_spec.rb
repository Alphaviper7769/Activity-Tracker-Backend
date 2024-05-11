# spec/requests/users_spec.rb
require 'rails_helper'
require 'rack/test'

RSpec.describe 'Users API', type: :request do
  include Rack::Test::Methods

  describe 'POST /api/register' do
    it 'creates a new user and returns a token' do
      post '/api/register', { name: 'Test User', email: 'test@example.com', password: 'password' }
      expect(last_response).to be_created
      expect(JSON.parse(last_response.body)).to include('token')
    end

    it 'returns unprocessable entity if registration fails' do
      post '/api/register', { name: '', email: 'test@example.com', password: 'password' }
      expect(last_response.status).to eq(422)
    end
  end

  describe 'POST /api/login' do
    let!(:user) { create(:user, email: 'test@example.com', password: 'password') }

    it 'authenticates the user and returns a token' do
      post '/api/login', { email: 'test@example.com', password: 'password' }
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to include('token')
    end

    it 'returns unauthorized if credentials are invalid' do
      post '/api/login', { email: 'invalid@example.com', password: 'password' }
      expect(last_response.status).to eq(401)
    end
  end

  describe 'POST /api/logout' do
    let!(:user) { create(:user) }
    let!(:token) { user.generate_jwt }

    it 'logs out the user' do
      header 'Authorization', "Bearer #{token}"
      post '/api/logout'
      expect(last_response).to be_ok
    end

    it 'returns unauthorized if user is not authenticated' do
      post '/api/logout'
      expect(last_response.status).to eq(401)
    end
  end
end
