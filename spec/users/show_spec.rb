require 'rails_helper'

RSpec.describe User, type: :system do
  before(:each) do
    @user = User.create(name: 'Jacob', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Guatemala.')
    @post1 = Post.create(title: 'First post', text: 'This is my first post', author: @user)
    @post2 = Post.create(title: '2nd post', text: 'Second post', author: @user)
    @post3 = Post.create(title: 'Numero 3 post', text: '3rd post is here', author: @user)
    @post4 = Post.create(title: '4th post', text: 'May the Forth be with you', author: @user)
  end

  describe 'User show Page' do
    before(:each) do
      visit user_path(@user.id)
    end

    it 'displays the user name' do
      # visit users_path
      expect(page).to have_content('Jacob')
    end

    it 'displays the user profile picture' do
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end

    it 'displays the correct number of posts' do
      expect(page).to have_content('Posts: 4')
    end

    it 'displays the bio' do
      expect(page).to have_content('Teacher from Guatemala.')
    end

    it 'displays the first 3 posts' do
      expect(page).not_to have_content('This is my first post')
      expect(page).to have_content('Second post')
      expect(page).to have_content('3rd post is here')
      expect(page).to have_content('May the Forth be with you')
    end

    it 'clicking on the post should take you to the post show page' do
      click_on('Forth')
      expect(page).to have_content('Back to Posts')
    end

    it 'displays the See all posts button' do
      expect(page).to have_content('See All Posts')
    end

    it 'clicking on the See All Posts button should take you to the user posts index page' do
      click_on('See All Posts')
      expect(page).to have_content('Likes')
    end
  end
end
