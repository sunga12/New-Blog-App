require 'swagger_helper'

describe 'Comments API' do

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do

    get 'Retrieves comments' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, :in => :path, :type => :string
      parameter name: :post_id, :in => :path, :type => :string

      response '200', 'Comments retrieved' do
        schema type: :array,
        items: {
          type: :object,
          properties: {
          id: { type: :integer, nullable: false },
          author: {
            type: :object,
            author_id: { type: :integer, nullable: false }
          },
          post: {
            type: :object,
            post_id: { type: :integer, nullable: false },
            created_at: { type: :string, format: 'date-time' },
            updated_at: { type: :string, format: 'date-time' },
            title: { type: :string },
            text: { type: :string },
            comments_counter: { type: :integer },
            likes_counter: { type: :integer },
          },
          text: { type: :string },
          created_at: { type: :string, format: 'date-time' },
          updated_at: { type: :string, format: 'date-time' }
          },
          required: [ 'id', 'author_id', 'post_id', 'text' ]
        }

        let(:user) { User.create(name: 'Jackson', bio: 'Robot AI') }
        # let(:user_id) { user.id }
        let(:post) { Post.create(author: :user, title: 'Introducing me', text: 'I am a Robot AI') }
        let(:id) { Comment.create(post: :post, author: :user, text: 'One Amazing test comment').id }

        run_test!
      end

      response '404', 'Comments not found' do
        let(:id) { 'invalid' }
        run_test!
      end

    end
  end
end
