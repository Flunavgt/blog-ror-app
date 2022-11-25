require 'rails_helper'
# require 'database'

RSpec.describe Like, type: :like do
  it 'like method test' do
    author = User.create!(name: 'Erik', posts_counter: 0)
    post = Post.create!(author:, title: 'This is secod test', comments_counter: 0, likes_counter: 0)
    Like.create!(author:, post:)
    lastpost = Post.last
    expect(lastpost.likes_counter).to eq 1
  end
end
