require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET #index' do
    before(:each) { get '/users' }
    it 'returns 200 Ok for index action on /users' do
      expect(response).to have_http_status :success
    end

    it 'returns the users/index view for index action on /users' do
      expect(response).to render_template(:index)
    end

    it 'return the users/index view includes the All Users placeholder text' do
      expect(response.body).to include('All users')
    end
  end
  describe 'GET #show' do
    before(:each) { get '/users/1' }
    it 'returns the users/show view for show action on /users/1' do
      expect(response).to render_template :show
    end

    it 'returns the users/show view that includes user key_word' do
      expect(response.body).to include 'user'
    end
    it 'returns 200 Ok for index action on /users/1' do
      expect(response).to have_http_status :success
    end
  end
end
