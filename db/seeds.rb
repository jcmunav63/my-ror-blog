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
  name: 'Tom Jones',
  photo: 'users/3.PNG',
  bio: 'English developer',
  email: "tomjones@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

user2 = User.new(
  name: 'Jessica Smith',
  photo: 'users/4.PNG',
  bio: 'American developer',
  email: "jessicasmith@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

user3 = User.new(
  name: 'Ann Murray',
  photo: 'users/6.PNG',
  bio: 'Polish developer',
  email: "annmurray@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

user4 = User.new(
  name: 'Hellen Sunrise',
  photo: 'users/7.PNG',
  bio: 'Southafrican developer',
  email: "hellensunrise@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

user5 = User.new(
  name: 'Paul Bunyon',
  photo: 'users/8.PNG',
  bio: 'French developer',
  email: "paulbunyon@gmail.com", 
  password: "me1234", 
  password_confirmation: "me1234"
)
user.skip_confirmation! #only if using confirmable in devise settings in user model.
user.save!

# Add some posts

