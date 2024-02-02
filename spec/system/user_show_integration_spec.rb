require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  let(:user) { create(:user, name: 'John Smith', bio: 'Lorem ipsum dolor sit amet.') }
  let!(:post1) { create(:post, author: user, title: 'First Post', text: 'Lorem ipsum') }
  let!(:post2) { create(:post, author: user, title: 'Second Post', text: 'Dolor sit amet') }
  let!(:post3) { create(:post, author: user, title: 'Third Post', text: 'Consectetur adipiscing') }

  before do
    visit user_path(user)
  end

  it 'shows the user\'s profile picture' do
    # expect(page).to have_css('.user-profile-picture')
    expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
    # Adjust the selector as per your actual HTML structure
  end

  it 'shows the user\'s username' do
    expect(page).to have_content(user.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'shows the user\'s bio' do
    expect(page).to have_content(user.bio)
  end

  it 'shows the user\'s last 3 posts' do
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).not_to have_content('Fourth Post')
    # Assuming you only want to show the last 3
  end

  it 'shows a button to view all of a user\'s posts' do
    expect(page).to have_link('See All Posts', href: user_posts_path(user))
  end

  # it 'redirects to the post\'s index page when clicking a user\'s post' do
  #   click_link "Post #{post1.id}"
  #   expect(page).to have_current_path(post_path(post1))
  # end

  it 'redirects to the user\'s post index page when clicking "See All Posts"' do
    click_link 'See All Posts'
    expect(page).to have_current_path(user_posts_path(user))
  end
end
