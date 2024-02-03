require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  let!(:user3) { User.create(name: 'user3', photo: 'users/3.PNG', posts_counter: 3) }
  let!(:user6) { User.create(name: 'user6', photo: 'users/6.PNG', posts_counter: 5) }

  before do
    Capybara.current_driver = :rack_test
    visit users_path
    sleep(5)
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content('user3')
    expect(page).to have_content('user6')
  end

  scenario 'I can see the profile picture for each user' do
    expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
    expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
  end

  scenario 'I can see the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 3', wait: 10)
    expect(page).to have_content('Number of posts: 5', wait: 10)
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    click_link user3.name
    sleep 5
    expect(page).to have_current_path(user_path(user3))
  end
end
