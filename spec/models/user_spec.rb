require 'rails_helper'

RSpec.describe 'The User model tests' do
  it 'User is not valid if the name is nil' do
    user1 = User.new(name: nil)
    expect(user1).to_not be_valid
  end

  it 'User saving is invalid with a negative posts_counter' do
    user2 = User.new(posts_counter: -1)
    expect(user2).to_not be_valid
  end

  it 'Returns the three most recent posts of a user' do
    user3 = User.create!(name: 'Test User', posts_counter: 0,
                         photo: 'https://cdn.unsplash.com/photo/2018/02/27/16/10/desert-273018_740.jpg',
                         bio: 'Professot from India')
    valid_text = 'This is a valid post text.'

    Post.create!(title: 'Old Post', author: user3, comments_counter: 0, likes_counter: 0,
                 text: valid_text, created_at: 3.days.ago)

    recent_posts = 3.times.map do |i|
      Post.create!(title: "Post #{i}", author: user3, comments_counter: 0, likes_counter: 0,
                   text: valid_text, created_at: i.days.ago)
    end

    expect(user3.three_most_recent_posts).to match_array(recent_posts)
  end
end
