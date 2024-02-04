require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do

  consumes 'application/json'
  produces 'application/json'
  tags 'Posts'

  path '/api/v1/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :integer, description: 'user_id'

    def set_response_example(example)
      example.metadata[:response][:content] = {
        'application/json' => {
          example: JSON.parse(response.body, symbolize_names: true)
        }
      }
    end

    get('list posts') do
      response(200, 'successful') do
        let(:user_id) { 123 }
        after { set_response_example(example) }
        run_test!
      end
    end

    post('create post') do
      response(200, 'successful') do
        let(:user_id) { 123 }
        after { set_response_example(example) }
        run_test!
      end
    end
  end
end
