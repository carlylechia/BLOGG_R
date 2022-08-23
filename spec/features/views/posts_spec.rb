require 'rails_helper'

RSpec.describe Post, type: :view do
  before :each do
    @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_count: 0)
    @user.posts.create!(title: 'Title', text: 'Body')
    visit user_post_path(@user, @user.posts.first)
  end

  context 'show page' do
    it 'Should display post\'s title' do
      expect(page).to have_content('Title')
    end
    it 'Should display post author name' do
      expect(page).to have_content('by Tom')
    end
    it 'should display post\'s comment counter' do
      expect(page).to have_content('0 comments')
    end
    it 'should display post\'s likes counter' do
      expect(page).to have_content('0 likes')
    end
    it 'Should display post\'s text' do
      expect(page).to have_content('Body')
    end
    it 'Should display comment user name' do
      @user.posts.first.comments.create(text: 'Comment', user: @user)
      visit user_post_path(@user, @user.posts.first)
      expect(page).to have_content('~>Tom: Comment')
    end
  end

  context 'index page' do
    it 'Should have Add post button' do
      visit user_path(@user.id)
      expect(page).to have_content('Title')
      expect(page).to have_content('Add post')
    end

    it 'Should display add post form' do
      visit user_path(@user.id)
      click_link 'Add post'
      expect(current_path).to eq(new_post_path)
      expect(response).to render_template('new')
    end

    it 'Should create new post' do
      visit new_post_path
      fill_in 'post[title]', with: 'New Title'
      fill_in 'post[text]', with: 'New Body'
      click_button 'Submit new post'
      expect(current_path).to eq(user_posts_path(@user.id))
      expect(page).to have_content('New Title')
    end
  end
end
