require 'rails_helper'

RSpec.describe 'user_path', type: :system do
  describe 'user show page' do
    it 'shows the user photo' do
      visit user_path(User.first)
      expect(page).to have_css("img[src*='#{User.first.photo}']")
    end
    it 'shows the user username' do
      visit user_path(User.first)
      expect(page).to have_content('Tom')
    end
    it 'shows the user bio' do
      visit user_path(User.first)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'shows the user number of posts' do
      visit user_path(User.first)
      expect(page).to have_content('Number of posts: 0')
    end
    it 'redirects to post show page when cliked' do
      first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/seed/picsum/536/354',
                               bio: 'Teacher from Mexico.')
      first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
      visit "/users/#{first_user.id}/posts"
      click_on Post
      expect(page).to have_current_path(user_post_path(first_user.id, first_post.id))
    end
  end
end

# require 'rails_helper'

# RSpec.describe 'Author show page', type: :feature do
#   before(:each) do
#     first_user = User.create(name: 'Tom', photo: 'https://picsum.photos/seed/picsum/536/354',
#                              bio: 'Teacher from Mexico.')
#     second_user = User.create(name: 'Lilly', photo: 'https://picsum.photos/536/354',
#                               bio: 'Teacher from Poland.')

#     first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
#     second_post = Post.create(author: second_user, title: 'My Second', text: 'I am so nervous')

#     Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
#     Comment.create(post: second_post, author: second_user, text: 'I have seen your post')

#     describe 'show page' do
#       it 'see the user\'s profile picture.' do
#         visit 'http://localhost:3000/users/2'
#         images = page.all('img')
#         expect(images.count).to eq(1)
#       end

#       describe 'show page' do
#         it 'see the user\'s profile picture.' do
#           images = page.all('img')
#           expect(images.count).to eq(1)
#         end
#     end
#   end
# end
