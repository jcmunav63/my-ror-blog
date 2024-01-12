require 'rails_helper'

RSpec.describe 'The Like model tests' do
  it 'Updates the post\'s likes_counter when creating a new like' do
    user1 = User.create(name: 'Paul Ramsey', photo: 'https://cdn.pixabay.com/photo/2005/03/22/17/15/songs-76388_320.jpg',
                        bio: 'Canadian Developer', posts_counter: 0)
    post1 = Post.create(author_id: user1.id, title: 'Post #10', text: 'A post about programming in Ruby.',
                        comments_counter: 0, likes_counter: 0)
    like1 = Like.create(post: post1, user: user1)

    expect(like1).to be_valid
    expect(post1.likes_counter).to eq(1)
  end
end
