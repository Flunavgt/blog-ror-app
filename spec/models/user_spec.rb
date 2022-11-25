require_relative '../rails_helper'

RSpec.describe User, type: :author do
  subject { User.new(name: 'diego', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter greater or equal to 0' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end

  it 'Last 3 post marked as empty' do
    second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    expect(second_user.recent_post).to eq([])
  end
end
