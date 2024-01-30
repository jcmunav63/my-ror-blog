require 'rails_helper'

RSpec.describe 'The Post model tests' do
  it 'Post is not valid if its title is nil' do
    user1 = User.create!(name: 'Test User', posts_counter: 0,
                         photo: 'https://cdn.pixabay.com/photo/2016/02/25/12/10/plants-276014_630.jpg')
    post1 = Post.new(title: nil, text: 'This is a valid post text', comments_counter: 0, likes_counter: 0,
                     author: user1)
    expect(post1).to_not be_valid
  end

  it 'Validates that a post\'s title is no longer than 250 characters' do
    user2 = User.create!(name: 'John Smith', posts_counter: 0,
                         photo: 'https://cdn.pixabay.com/photo/2015/02/25/16/10/flowers-276014_640.jpg')
    post2 = Post.new(author: user2, title: 'x' * 251, text: 'A valid text')
    expect(post2).to be_invalid
  end

  it 'Post is not valid if it has a negative comments_counter' do
    user3 = User.create!(name: 'Jane Simpson', posts_counter: 0,
                         photo: 'https://unsplash.com/photo/2019/03/20/11/10/sky-46014_440.jpg')
    post3 = Post.new(title: 'Valid Title', text: 'Valid text', comments_counter: -1, likes_counter: 0, author: user3)
    expect(post3).to_not be_valid
  end

  it 'Post is not valid if it has a negative likes_counter' do
    user4 = User.create!(name: 'Jimmy Nelson', posts_counter: 0,
                         photo: 'https://unsplash.com/photo/2020/02/19/11/10/earth-54014_224.jpg')
    post4 = Post.new(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: -1, author: user4)
    expect(post4).to_not be_valid
  end

  it 'Returns the five most recent comments of a post' do
    author5 = User.create!(name: 'Jack Daniels', posts_counter: 0,
                         photo: 'https://unsplash.com/photo/2018/06/20/15/10/lake-24014_764.jpg')
    post5 = Post.create!(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: 0, author: author5)
    valid_text = 'This is a valid comment text.'

    recent_comments = 5.times.map do |i|
      Comment.create!(text: "#{valid_text} #{i}", post: post5, author: author5, created_at: i.days.ago)
    end

    expect(post5.five_most_recent_comments).to match_array(recent_comments.reverse)
  end

  it 'Updates the user\'s posts_counter when creating a new post' do
    user6 = User.create!(name: 'Peter Drucker', posts_counter: 0,
                         photo: 'https://unsplash.com/photo/2017/03/21/15/12/sea-14922_554.jpg')
    Post.create!(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: 0, author: user6)

    expect(user6.reload.posts_counter).to eq(1)
  end
end
