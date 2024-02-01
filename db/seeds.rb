# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Add some users
user1 = User.new(
  id: '1',
  name: 'Tom Jones',
  photo: 'users/3.PNG',
  bio: 'English developer',
  email: "tomjones@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user1.save!
# user1.skip_confirmation! #only if using confirmable in devise settings in user model.

user2 = User.new(
  id: '2',
  name: 'Jessica Smith',
  photo: 'users/4.PNG',
  bio: 'American developer',
  email: "jessicasmith@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user2.save!
# user2.skip_confirmation! #only if using confirmable in devise settings in user model.

user3 = User.new(
  id: '3',
  name: 'Ann Murray',
  photo: 'users/6.PNG',
  bio: 'Polish developer',
  email: "annmurray@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user3.save!
# user3.skip_confirmation! #only if using confirmable in devise settings in user model.

user4 = User.new(
  id: '4',
  name: 'Hellen Sunrise',
  photo: 'users/7.PNG',
  bio: 'Southafrican developer',
  email: "hellensunrise@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user4.save!
# user4.skip_confirmation! #only if using confirmable in devise settings in user model.

user5 = User.new(
  id: '5',
  name: 'Paul Bunyon',
  photo: 'users/8.PNG',
  bio: 'French developer',
  email: "paulbunyon@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user5.save!
# user5.skip_confirmation! #only if using confirmable in devise settings in user model.

# Add some posts
