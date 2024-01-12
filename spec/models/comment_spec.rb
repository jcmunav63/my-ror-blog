require 'rails_helper'

RSpec.describe 'The Comment model tests' do
  it 'Updates the post\'s comment_counter when creating a new comment' do
    user1 = User.create(name: 'John Denver', photo: 'https://cdn.pixabay.com/photo/2005/03/22/17/15/songs-76388_320.jpg',
                        bio: 'American Professor', posts_counter: 0)
    post1 = Post.create(author_id: user1.id, title: 'Post #5', text: 'A post about computer programming.',
                        comments_counter: 0, likes_counter: 0)
    comment1 = Comment.create(post: post1, user: user1, text: 'This is a comment for this post!')

    expect(comment1).to be_valid
    expect(post1.comments_counter).to eq(1)
  end
end
