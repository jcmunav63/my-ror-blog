require 'rails_helper'
require 'factories/user.rb'

RSpec.describe 'User Index Page', type: :system do
  before do
    # Capybara.current_driver = :rack_test
    visit users_path
    sleep(5)
    @users = FactoryBot.create_list(:user, 5)
    @users.each { |user| FactoryBot.create_list(:post, 3, author: user) }
    visit users_path
  end
  # let!(:user3) { User.create(name: 'user3', photo: 'users/3.PNG', posts_counter: 3) }
  # let!(:user6) { User.create(name: 'user6', photo: 'users/6.PNG', posts_counter: 5) }

  # before do
    
  # end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content('user.name')
    # expect(page).to have_content('user6')
  end

  scenario 'I can see the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
    # expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
    # expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
  end

  scenario 'I can see the number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
    # expect(page).to have_content('Number of posts: 3', wait: 10)
    # expect(page).to have_content('Number of posts: 5', wait: 10)
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    user_to_test = @users.last
    click_on user_to_test.name
    expect(page).to have_current_path(user_path(user_to_test))
    # click_link user3.name
    # sleep 5
    # expect(page).to have_current_path(user_path(user3))
  end
end
