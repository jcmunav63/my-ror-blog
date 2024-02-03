require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :system do
  before do
    @user = create(:user)
    @posts = create_list(:post, 5, author: @user)
    @posts.each { |post| create_list(:comment, 3, post: post, author: @user) }

    visit user_posts_path(@user)
  end

  it 'displays the user\'s profile picture' do
    expect(page).to have_selector("img[src='#{@user.photo}']")
  end

  it 'displays the user\'s name' do
    expect(page).to have_link(@user.name, href: user_path(@user))
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'displays each post\'s title' do
    @posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it 'displays each post\'s text (body)' do
    @posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'displays each post\'s five most recent comments' do
    @posts.each do |post|
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end

  it 'displays each post\'s comments_counter' do
    @posts.each do |post|
      expect(page).to have_content("Comments: #{post.comments_counter}")
    end
  end

  it 'displays each post\'s likes_counter' do
    @posts.each do |post|
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays a link to view a post\'s show page' do
    @posts.first
    expect(page).to have_link('Read More', href: user_post_path(@user, @posts.first))
  end

  it 'displays a link to create a new post' do
    expect(page).to have_link('New Post', href: new_user_post_path(@user))
  end
end
