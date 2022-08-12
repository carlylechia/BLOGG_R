require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.new(name: 'Chia', photo: 'photo.png', bio: 'His bio')
    @user.save
    @post = Post.new(user: @user, title: 'First Post', text: 'Nothing here!')
    @post.save
    @like = Like.new(user: @user, post: @post)
    @like.save
  end

  it 'has increased the likes_count in posts table' do
    expect(@post.likes_count).to equal(1)
  end
end
