require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do
  let(:user) { User.create(name: 'John Carter', posts_counter: 3, photo: '/assets/users/user1.PNG') }

  before do
    # Create user's posts and comments for testing
    p = Post.create(author: user, title: 'Post 1', text: 'Lorem ipsum 1')
    q = Post.create(author: user, title: 'Post 2', text: 'Lorem ipsum 2')
    r = Post.create(author: user, title: 'Post 3', text: 'Lorem ipsum 3')

    Comment.create(post: p, author: user, text: 'Comment 1 for Post 1')
    Comment.create(post: p, author: user, text: 'Comment 2 for Post 1')
    Comment.create(post: q, author: user, text: 'Comment 1 for Post 2')
    Comment.create(post: q, author: user, text: 'Comment 2 for Post 2')
    Comment.create(post: r, author: user, text: 'Comment 1 for Post 3')
    Comment.create(post: r, author: user, text: 'Comment 2 for Post 3')

    visit user_posts_path(user)
  end

  it 'displays the user\'s profile picture' do
    expect(page).to have_css('.user-photo')
  end

  it 'displays the user\'s name' do
    expect(page).to have_link(user.name, href: user_path(user))
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'displays each post\'s title' do
    user.posts.each do |post|
      puts "Checking for title: #{post.title}"
      within(".post-line h3", text: post.title) do
        expect(page).to have_content("Post #{post.id}: #{post.title}")
      end
      # expect(page).to have_css(".post-line h3", text: "Post #{post.id}: #{post.title}")
    end
  end

  # it 'displays each post\'s title' do
  #   user1.posts.each do |post|
  #     expect(page).to have_content(post.title)
  #   end
  # end

  it 'displays each post\'s text' do
    user.posts.each do |post|
      puts "Checking for text: #{post.text}"
      within(".post-line p", text: post.text) do
        expect(page).to have_content(post.text)
      end
      # expect(page).to have_css(".post-line p", text: post.text)
    end
  end

  # it 'displays each post\'s text' do # CHECKING
  #   user1.posts.each do |post|
  #     expect(page).to have_content(post.text)
  #   end
  # end

  it 'displays each post\'s five most recent comments' do
    user.posts.each do |post|
      within(".post-line h3", text: "Post #{post.id}: #{post.title}") do
        within(".comments") do
          post.five_most_recent_comments.each do |comment|
            expect(page).to have_content("#{comment.author.name}: #{comment.text}")
          end
        end
      end
    end
  end

  # within(".post-container", text: "Post #{post.id}: #{post.title}") do
  #   post.five_most_recent_comments.each do |comment|
  #   expect(page).to have_content("#{comment.author.name}: #{comment.text}")
  # end
  

  it 'displays each post\'s comments_counter' do
    user.posts.each do |post|
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end
  end

  it 'displays each post\'s likes_counter' do
    user.posts.each do |post|
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays a link to view each post\'s show page' do
    expect(page).to have_link('Read More', href: user_post_path(user, user1.posts.first))
    expect(page).to have_link('Read More', href: user_post_path(user, user1.posts.second))
  end

  it 'displays a link to create a new post' do
    expect(page).to have_link('New Post', href: new_user_post_path(user))
  end

  private

  def truncate(text, options = {})
    ActionController::Base.helpers.truncate(text, options)
  end
end
