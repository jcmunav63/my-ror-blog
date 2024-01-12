require 'rails_helper'

RSpec.describe 'The Comment model tests' do
  it 'should have valid user, post and update comments_counter in post object' do
    user = User.create(id: 13, name: 'Elo', photo_url: 'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_640.jpg',
                       bio: 'Computer Eng', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    comment = Comment.create(post:, user:, text: 'Hi Elo!')

    expect(comment).to be_valid
    expect(post.comments_counter).to eq(1)
  end
end