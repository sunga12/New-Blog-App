require 'rails_helper'

RSpec.describe User, type: :system do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'My post', text: 'This is my first post', author: @user)
    @post2 = Post.create(title: 'My post', text: 'This is my first post', author: @user)
  end

  describe 'User Index Page' do
    before(:each) do
      visit users_path
    end

    it 'displays the user name' do
      visit users_path
      expect(page).to have_content('Tom')
    end

    it 'displays the user image' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the correct number of posts' do
      expect(page).to have_content('Posts: 2')
    end

    it 'clicking on the user name should take you to the user show page' do
      click_on('Tom')
      expect(page).to have_content('Tom')
    end
  end

  describe 'GET /users/:id' do
    it 'displays the user name' do
      visit user_path(@user.id)
      expect(page).to have_content('Tom')
    end
  end
end
