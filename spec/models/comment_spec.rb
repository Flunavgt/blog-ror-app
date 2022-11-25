require_relative '../rails_helper'

RSpec.describe Comment, type: :comment do
  it 'counter method test' do
    author = User.create!(name: 'Erik', posts_counter: 0)
    post = Post.create!(author:, title: 'Hello', comments_counter: 0, likes_counter: 0)
    Comment.create!(text: 'I am stressed', author:, post:)
    lastpost = Post.last
    expect(lastpost.comments_counter).to eq 1
  end
end
