class Like < ApplicationRecord
  # after_save :update_likes_counter

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  private

  def update_likes_counter
    post.increment!(:likes_count)
  end
end
