class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def last_posts
    Post.last(3)
  end
end
