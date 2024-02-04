require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  before do
    visit users_path
    sleep(3)
    @users = create_list(:user, 5)
    @users.each { |user| create_list(:post, 3, author: user) }
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario 'I can see the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
  end

  scenario 'I can see the number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    user_to_test = @users.last
    click_on user_to_test.name
    expect(page).to have_current_path(user_path(user_to_test))
  end
end
