require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'Renders the index template' do
      get users_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    it 'Renders the show template' do
      user = create(:user)
      get user_path(user)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end
end
