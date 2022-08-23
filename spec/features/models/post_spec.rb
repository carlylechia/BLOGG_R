require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: 'Ahmad', photo: 'photo.png', bio: 'His bio here!')
    @user.save
    @post = Post.new(user: @user, title: 'Post Title', text: 'Post Text')
    @post.save
  end

  it 'validates the post title is present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'validates the post title is not greater than 250 characters' do
    @post.title = 'a' * 251
    expect(@post).to_not be_valid
  end

  it 'validates comments_count is an integer value' do
    @post.comments_count = 'three'
    expect(@post).to_not be_valid
  end

  it 'validates posts_count is not less than 0' do
    @post.comments_count = -4
    expect(@post).to_not be_valid
  end

  it 'validates likes_count is an integer value' do
    @post.likes_count = 'three'
    expect(@post).to_not be_valid
  end

  it 'validates likes_count is not less than 0' do
    @post.likes_count = -4
    expect(@post).to_not be_valid
  end

  it 'expects the last_five_comments method to be defined' do
    expect(defined? @post.last_five_comments).to_not be_nil
  end
end
