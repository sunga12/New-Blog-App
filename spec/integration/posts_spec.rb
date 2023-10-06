require 'swagger_helper'

describe 'Posts API' do

  path '/api/v1/users/{user_id}/posts' do

    get 'Retrieves posts' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, :in => :path, :type => :string

      response '200', 'Posts retrieved' do
        schema type: :array,
        items: {
          type: :object,
          properties: {
          id: { type: :integer, nullable: false },
          author_id: { type: :integer, nullable: false },
          title: { type: :string },
          text: { type: :string },
          comments_counter: { type: :integer },
          likes_counter: { type: :integer },
          created_at: { type: :string, format: 'date-time' },
          updated_at: { type: :string, format: 'date-time' }
          },
          required: [ 'id', 'author_id', 'title', 'text' ]
        }

        let(:user) { User.create(name: 'Jackson', bio: 'Robot AI') }
        let(:user_id) { user.id }
        let(:id) { Post.create(author: :user, title: 'Introducing me', text: 'I am a Robot AI').id }
        run_test!
      end

      response '404', 'Posts not found' do
        let(:id) { 'invalid'}
        run_test!
      end

    end
  end
end
