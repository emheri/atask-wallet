require 'rails_helper'

RSpec.describe 'Api::V1::Authentications', type: :request do
  let(:user) { create(:user) }

  describe 'POST /api/v1/auth/sign_in' do
    it 'return ok status' do
      post '/api/v1/auth/sign_in', params: { email: user.email, password: '123456' }
      expect(response).to have_http_status(:ok)
    end

    it 'return unauthorized with non exist email' do
      post '/api/v1/auth/sign_in', params: { email: 'test@email.com', password: '123456' }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'return unauthorized with wrong password' do
      post '/api/v1/auth/sign_in', params: { email: user.email, password: 'qwerty' }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /api/v1/auth/refresh_token' do
    it 'return ok status' do
      get '/api/v1/auth/refresh_token',
          headers: { 'Authorization' => "Bearer #{login_data['access_token']}" },
          params: { refresh_token: login_data['refresh_token'] }
      expect(response).to have_http_status(:ok)
    end

    it 'return unauthorized missing refresh token' do
      get '/api/v1/auth/refresh_token',
          headers: { 'Authorization' => "Bearer #{login_data['access_token']}" }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'return unauthorized with invalid refresh token' do
      get '/api/v1/auth/refresh_token',
          headers: { 'Authorization' => "Bearer #{login_data['access_token']}" },
          params: { refresh_token: 'abc' }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  def login_data
    post '/api/v1/auth/sign_in', params: { email: user.email, password: '123456' }
    response.parsed_body['data']
  end
end
