require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    before(:each) { get '/users/1/posts' }
    it 'returns status 200 Ok for /users/1/posts' do
      expect(response).to have_http_status :success
    end

    it 'returns posts/index view for posts/index action' do
      expect(response).to render_template :index
    end

    it 'returns posts/index view that includes the posts keyword' do
      expect(response.body).to include 'Posts'
    end
  end
end
