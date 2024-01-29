require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  let(:user) { User.create(id: 1, name: 'user1', photo: 'user1.PNG', posts_counter: 3) }
  let(:user2) { User.create(id: 2, name: 'user2', photo: 'user2.PNG', posts_counter: 5) }

  before do
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
    # expect(page).to have_css('.user-line .name', text: user1.name)
    # expect(page).to have_css('.user-line .name', text: user2.name)
  end

  scenario 'I can see the profile picture for each user' do
    expect(page).to have_css(".user-line img[src='#{user1.photo}']")
    expect(page).to have_css(".user-line img[src='#{user2.photo}']")
  end

  scenario 'I can see the number of posts each user has written' do
    within(".user-line", text: user1.name) do
      expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    end
  
    within(".user-line", text: user2.name) do
      expect(page).to have_content("Number of posts: #{user2.posts_counter}")
    end
    # expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    # expect(page).to have_content("Number of posts: #{user2.posts_counter}")
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    click_link user1.name
    expect(page).to have_current_path(user_path(user1))
  end
