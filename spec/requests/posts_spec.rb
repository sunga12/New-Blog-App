require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: 'Jackson', bio: 'Robot AI') }

    before { get user_posts_path(user.id) }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end

    # it 'contains the coreect placeholder text' do
    #   expect(response.body).to include('Here is a list of posts for a given user')
    # end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Jackson', bio: 'Robot AI') }
    let(:post) { Post.create(author: user, title: 'Introducing me', text: 'I am a Robot AI') }

    before do
      get user_post_path(user.id, post.id)
    end

    it 'returns http success' do
      puts response
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('show')
    end

    # it 'renders the right action' do
    #   expect(response.body).to include('Here is a post for a given user')
    # end
  end
end
