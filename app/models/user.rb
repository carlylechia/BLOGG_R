class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def last_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
