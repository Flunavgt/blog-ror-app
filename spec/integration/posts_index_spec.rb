require 'swagger_helper'

describe 'Posts API' do
  path 'api/v1/users' do
    get 'Retrieves users' do
      tags 'Users'
      consumes 'application/json'

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 bio: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 photo: { type: :string },
                 post_counter: { type: :integer },
                 email: { type: :string },
                 role: { type: :string }
               }
        run_test!
      end
    end
  end

  path '/api/v1/auth/login' do
    post 'Log in' do
      tags 'Log in'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '200', 'OK' do
        schema type: :object,
               properties: {
                 token: { type: :string },
                 exp: { type: :string },
                 email: { type: :string }
               }
        run_test!
      end
      response '401', 'Unauthorized' do
        let(:id) { { error: 'unauthorized' } }
        run_test!
      end
    end
  end

  path 'api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'User'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 bio: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 photo: { type: :string },
                 post_counter: { type: :integer },
                 email: { type: :string },
                 role: { type: :string }
               }
        let(:header) { { authorization: token } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'User not found' } }
        run_test!
      end
    end
  end

  path 'api/v1/users/{id}/posts' do
    get 'Retrieves posts of users(id)' do
      tags 'Posts', 'User'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer }
               }
        let(:header) do
          { authorization: token }
        end
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'Posts not found' } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'User not found' } }
        run_test!
      end
    end
  end

  path 'api/v1/users/{user_id}/posts/{id}' do
    get 'Retrieves a post' do
      tags 'Posts', 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer }
               }
        let(:header) do
          { authorization: token }
        end
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'Post not found' } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'User not found' } }
        run_test!
      end
    end
  end

  path 'api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieve comments' do
      tags 'Posts', 'Users', 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer },
                 post_id: { type: :integer }
               }
        let(:header) do
          { authorization: token }
        end
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'User and/or post not found' } }
        run_test!
      end
    end
  end

  path 'api/v1/users/{user_id}/posts/{post_id}/comments/{id}' do
    get 'Retrieves a comment' do
      tags 'Posts', 'Users', 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer },
                 post_id: { type: :integer }
               }
        let(:header) do
          { authorization: token }
        end
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'Comment not found' } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { { error: 'User and/or post not found' } }
        run_test!
      end
    end
  end
end
# require 'rails_helper'

# RSpec.describe 'posts#index', type: :feature do
#   describe 'Post' do
#     before(:each) do
#       @user1 = User.create(name: 'Aleazar', photo: 'https://picsum.photos/seed/picsum/536/354', bio: 'bio',
#                            posts_counter: 0)
#       @user1.save!
#       visit root_path

#       @post1 = Post.create(title: 'First Post', text: 'This is my first post', comments_counter: 0, likes_counter: 3,
#                            author: @user1)
#       @post2 = Post.create(title: 'Second Post', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
#                            author: @user1)
#       @post3 = Post.create(title: 'Third Post', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
#                            author: @user1)
#       @comment1 = Comment.create(text: 'Comment first', author: User.first,
#                                  post: @post1)
#       @comment2 = Comment.create(text: 'Comment another', author: User.first, post: @post1)
#       @comment3 = Comment.create(text: 'Comment new', author: User.first, post: @post1)
#     end
#     it "shows user's profile picture" do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_css('img[src*="https://picsum.photos/seed/picsum/536/354"]')
#     end

#     it 'shows the users username' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content('Aleazar')
#     end

#     it 'shows number of posts of user has written' do
#       visit(user_posts_path(@user1.id))
#       expect(@user1.posts_counter).to eql(3)
#     end

#     it 'shows number of posts by user' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content('posts: 3')
#     end

#     it 'shows posts title' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content('First Post')
#     end

#     it 'can see some of the post detail' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content 'This is my first post'
#     end

#     it 'can see the first comment on a post' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content 'Comment first'
#     end

#     it 'can see how many comments a post has.' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content('Comments: 3')
#     end

#     it 'can see how many likes a post has.' do
#       visit(user_posts_path(@user1.id))
#       expect(page).to have_content('Likes: 3')
#     end
#     it "When I click on a post, it redirects me to that post's show page" do
#       visit(user_posts_path(@user1.id))
#       click_link 'First Post'
#       expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
#     end
#   end
# end
