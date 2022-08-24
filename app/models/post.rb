class Post < ApplicationRecord
  # after_save :update_post_counter
  after_initialize :init

  validates_presence_of :title, :text
  validates :title, length: { maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :likes

  def last_five_comments
    comments.limit(5).order(created_at: :desc).includes([:user])
  end

  private

  def update_post_counter
    user.increment!(:posts_count)
  end

  def init
    self.comments_count ||= 0
    self.likes_count ||= 0
    true
  end
end
