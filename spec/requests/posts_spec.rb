require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/1/posts' }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end

    it 'contains the coreect placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    before do
      user = 123
      post = 1
      get user_post_path(user, post)
    end

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('show')
    end

    it 'renders the right action' do
      expect(response.body).to include('Here is a post for a given user')
    end
  end
end
