require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  let(:user1) do
    User.create(name: 'John Smith', photo: '/assets/users/user1.PNG', bio: 'Lorem ipsum dolor sit amet,
   consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac tortor dignissim
     convallis aenean et. Lectus magna fringilla urna porttitor rhoncus dolor. Consequat interdum varius sit amet
      mattis vulputate. Fringilla urna porttitor rhoncus dolor purus non enim.')
  end

  let!(:post1) { Post.create(author: user1, title: 'First Post', text: 'Lorem ipsum') }
  let!(:post2) { Post.create(author: user1, title: 'Second Post', text: 'Dolor sit amet') }
  let!(:post3) { Post.create(author: user1, title: 'Third Post', text: 'Consectetur adipiscing') }

  before do
    visit user_path(user1)
  end

  it 'shows the user\'s profile picture' do
    expect(page).to have_css('.user-line img[src^="/assets/users/"][src*=".PNG"]')
  end

  it 'shows the user\'s username' do
    expect(page).to have_content(user1.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
  end

  it 'shows the user\'s bio' do
    bio_text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
       et dolore magna aliqua. Ac tortor dignissim convallis aenean et. Lectus magna fringilla urna porttitor rhoncus
        dolor. Consequat interdum varius sit amet mattis vulputate. Fringilla urna porttitor rhoncus dolor purus non
         enim.'
    expect(page).to have_content(normalize_whitespace(bio_text))
  end

  it 'shows the user\'s last 3 posts' do
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).not_to have_content('Fourth Post')
  end

  it 'shows a button to view all of a user\'s posts' do
    expect(page).to have_link('See All Posts', href: user_posts_path(user1))
  end

  it 'Displays a link of each user\'s post and redirects me to that post\'s show page' do
    @posts = [post1, post2, post3]
    @posts.each do |_post|
      expect(page).to have_link('Show')
    end
  end

  it 'redirects to the user\'s post index page when clicking "See All Posts"' do
    click_link 'See All Posts'
    expect(page).to have_current_path(user_posts_path(user1))
  end

  def normalize_whitespace(text)
    text.gsub(/\s+/, ' ').strip
  end
end
