class Post < ApplicationRecord
  # after_save :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

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
