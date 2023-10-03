require 'rails_helper'

RSpec.describe User, type: :system do
  before(:each) do
    @user1 = User.create(name: 'Jacob', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Guatemala.')
    @user2 = User.create(name: 'Milly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Engineer from Zambia')
    @user3 = User.create(name: 'Barbara', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Lawyer from Italy')
    @post1 = Post.create(title: 'First post', text: 'This is my first post', author: @user1)
    @comment1 = Comment.create(post: @post1, text: 'Congrats', author: @user2)
    @comment2 = Comment.create(post: @post1, text: 'Welcome to the post', author: @user2)
    @comment3 = Comment.create(post: @post1, text: 'Nice to meet you', author: @user2)
    @like1 = Like.create(post: @post1, author: @user2)
    @like2 = Like.create(post: @post1, author: @user3)

  end

  describe 'Post show Page' do
    before(:each) do
      visit user_post_path(user_id: @user1.id, id: @post1.id)
    end

    it 'displays the post title' do
      expect(page).to have_content('First post')
    end

    it 'displays the post author' do
      # visit users_path
      expect(page).to have_content('Jacob')
    end

    it 'displays the correct number of comments' do
      expect(page).to have_content('Comments: 3')
    end

    it 'displays the correct number of likes' do
      expect(page).to have_content('Likes: 2')
    end

    it 'displays the post body' do
      expect(page).to have_content('This is my first post')
    end

    it 'displays the name of the comment creator' do
      expect(page).to have_content('Milly')
    end

    it 'displays the comment text' do
      expect(page).to have_content('Congrats')
      expect(page).to have_content('Welcome to the post')
      expect(page).to have_content('Nice to meet you')
    end

  end

end