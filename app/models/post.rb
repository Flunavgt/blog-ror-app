class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.last(5)
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
