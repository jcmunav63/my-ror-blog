require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'Renders the posts index template' do
      user = User.create(name: 'User1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
      Post.create(author: user, title: 'Test Post', text: 'Amet dictum sit amet justo donec enim diam vulputate ut.
       Etiam sit amet nisl purus in mollis nunc.')

      get user_posts_path(user)
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
      expect(response.body).to include('User All Posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'Renders the show post template' do
      user = User.create(name: 'User1', bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
      post = Post.create(author: user, title: 'Test Post', text: 'Amet dictum sit amet justo donec enim diam
       vulputate ut. Etiam sit amet nisl purus in mollis nunc.')
      get user_post_path(user, post)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
      expect(response.body).to include('Single Post Page')
    end
  end
end
