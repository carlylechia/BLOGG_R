class User < ApplicationRecord
  after_initialize :init
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def last_three_posts
    posts.limit(3).order(created_at: :desc)
  end

  def init
    self.posts_count ||= 0
  end

  def as_json(_options = {})
    super(only: %i[id name bio posts_count admin])
  end
end
