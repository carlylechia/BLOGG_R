class Comment < ApplicationRecord
  after_save :update_comments_counter

  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  private

  def update_comments_counter
    post.increment!(:comments_count)
  end
end
