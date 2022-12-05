require 'rails_helper'

RSpec.describe 'Test Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Aleazar', photo: 'Aleazar.png', bio: 'bio1', posts_counter: 4)
      @first_user.save!
      @second_user = User.create(name: 'Fedrico', photo: 'Fedrico.png', bio: 'bio2', posts_counter: 5)
      @second_user.save!
      @third_user = User.create(name: 'Fedrico Second', photo: 'Fedrico.png', bio: 'bio3', posts_counter: 2)
      @third_user.save!
    end

    it 'shows the users username' do
      visit root_path
      expect(page).to have_content('Aleazar')
      expect(page).to have_content('Fedrico')
      expect(page).to have_content('Fedrico Second')
    end

    it 'shows the number of posts of each user' do
      visit root_path
      expect(page).to have_content('4')
      expect(page).to have_content('5')
      expect(page).to have_content('2')
    end
  end
end
