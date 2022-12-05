# require_relative '../rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     context 'testing GET /index' do
#       it 'rendering users page index' do
#         get 'http://localhost:3000/users/2/posts'
#         expect(response).to render_template('posts/index')
#       end
#     end

# it 'checks if the correct themplate was rendered' do
#   get 'http://localhost:3000/users/2/posts'
#   expect(response).to render_template(:index)
# end

# it 'return success' do
#   get 'http://localhost:3000/users/2/posts'
#   expect(response).to have_http_status(:success)
# end

#     it 'checks  correct placeholder text' do
#       get 'http://localhost:3000/users/2/posts'
#       expect(response.body).to include('All posts go here')
#     end
#   end
# end
