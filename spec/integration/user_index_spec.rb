require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:each) do
      @user1 = User.create(name: 'Aleazar', photo: 'https://picsum.photos/seed/picsum/536/354',
                           bio: 'bio', posts_counter: 0)
      @user1.save!
      visit root_path

      @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 3,
                           author: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                           author: @user1)
      @comment1 = Comment.create(text: 'Comment first', author: User.first,
                                 post: @post1)
      @comment2 = Comment.create(text: 'Comment another', author: User.first, post: @post1)
      @comment3 = Comment.create(text: 'Comment new', author: User.first, post: @post1)
    end
    it "shows user's profile picture" do
      visit(user_path(@user1.id))
      expect(page).to have_css('img[src*="https://picsum.photos/seed/picsum/536/354"]')
    end

    it 'shows the users username' do
      visit(user_path(@user1.id))
      expect(page).to have_content('Aleazar')
    end

    it 'shows number of posts of user has written' do
      visit(user_path(@user1.id))
      expect(@user1.posts_counter).to eql(3)
    end

    it 'shows number of posts by user' do
      visit(user_posts_path(@user1.id))
      expect(page).to have_content('posts: 3')
    end

    it "When I click on a user, it redirects me to that user's show page" do
      visit '/users'
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
