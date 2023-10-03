require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before { get users_path }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      expect(response).to render_template('index')
    end

    # it 'contains the coreect placeholder text' do
    #   expect(response.body).to include('Here is a list of users')
    # end
  end

  describe 'GET /show' do
    let(:user) { User.create(name: 'Jackson', bio: 'Robot AI') }

    before do
      get user_path(user.id)
    end

    it 'returns http success' do
      puts response.status
      expect(response.status).to eq(200)
    end

    it 'renders the right action' do
      puts response
      expect(response).to render_template('show')
    end

    # it 'renders the right action' do
    #   expect(response.body).to include('Here is a given user')
    # end
  end
end
