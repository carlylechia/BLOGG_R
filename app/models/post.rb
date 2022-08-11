class Post < ApplicationRecord
  after_save :update_post_counter

  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :likes

  def last_five_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    user.increment!(:posts_count)
  end
end
