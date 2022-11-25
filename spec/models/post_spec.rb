require_relative '../rails_helper'

RSpec.describe Post, type: :post do
  before { Post.create(title: 'New Post', comments_counter: 0, likes_counter: 0) }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should have less than 250 characters' do
    subject.title = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Sed volutpat placerat tempus. Integer non magna eget augue mattis porttitor.
    Aliquam pulvinar felis sit amet diam mattis, quis pharetra quam pellentesque.
    Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
    turpis egestas. Mauris in lorem id odio tempor mollis. Suspendisse eros augue,
    imperdiet quis quam quis, hendrerit aliquam orci. Vestibulum sit amet lectus mi.
    Cras vehicula convallis dapibus. Integer porta, arcu et ultrices consectetur,
    interdum ligula metus et magna. Vivamus nisi nisi, pharetra in sem a, pharetra
    bibendum est. Fusce finibus'
    expect(subject).to_not be_valid
  end

  it 'comments_counter greater or equal to 0' do
    subject.comments_counter = -2
    expect(subject).to_not be_valid
  end

  it 'like counter test' do
    subject.likes_counter = -5
    expect(subject).to_not be_valid
  end

  it 'recent comments method' do
    expect(subject.last_five_comments).to eq([])
  end

  it 'counter method test' do
    author = User.create!(name: 'diego', posts_counter: 0)
    Post.create!(author:, title: 'the post', comments_counter: 0, likes_counter: 0)
    lastauthor = User.last
    expect(lastauthor.posts_counter).to eq 1
  end
end
