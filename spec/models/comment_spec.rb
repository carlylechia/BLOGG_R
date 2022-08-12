require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Chia', photo: 'photo.png', bio: 'His bio')
    @user.save
    @post = Post.new(user: @user, title: 'First Post', text: 'Nothing here!')
    @post.save
    @comment = Comment.new(user: @user, post: @post, text: 'Wow!')
    @comment.save
    @comment = Comment.new(user: @user, post: @post, text: 'second!')
    @comment.save
  end

  it 'has increased the comments_count in posts table' do
    expect(@post.comments_count).to equal(2)
  end
end
