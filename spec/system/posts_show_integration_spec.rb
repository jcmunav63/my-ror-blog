require 'rails_helper'

RSpec.describe 'Posts Show Page', type: :system do
  before do
    @user = create(:user)
    @post = create(:post, author: @user)
    @comments = create_list(:comment, 3, post: @post, author: @user)

    visit user_post_path(@user, @post)
  end

  scenario 'displays the post\'s title' do
    expect(page).to have_content("Post: #{@post.id} by: #{@user.name}")
  end

  scenario 'displays the post\'s author' do
    expect(page).to have_content("by: #{@post.author.name}")
  end

  scenario 'displays the post\'s number of comments' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  scenario 'displays the post\'s number of comments' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  scenario 'displays the post\'s text (body)' do
    expect(page).to have_content(@post.text)
  end

  scenario 'displays the username on each comment' do
    @comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it 'displays the text of each comment' do
    @comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
