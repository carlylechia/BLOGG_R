require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
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
