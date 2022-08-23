require 'rails_helper'

RSpec.describe 'Response body include correct placeholder', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
    @post = Post.create(
      title: 'Title',
      text: 'Body'
    )
  end

  describe 'Visit #index' do
    it 'displays the rigth content' do
      visit users_path
      expect(page).to have_content('All')
    end
  end
  describe 'Visit #show' do
    it 'contains user bio' do
      visit user_path(User.ids)
      expect(page).to have_content('Chia')
    end
  end
end
