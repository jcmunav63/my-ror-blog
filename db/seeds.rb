# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

first_user = User.create(name: 'Julio', photo: 'users/1.PNG', bio: 'Developer from El Salvador.', email: "julio@gmail.com", password: "me1234", password_confirmation: "me1234")
second_user = User.create(name: 'Alejandro', photo: 'users/2.PNG', bio: 'Developer from El Salvador.', email: "alejandro@gmail.com", password: "me1234", password_confirmation: "me1234")
third_user = User.create(name: 'Damaris', photo: 'users/3.PNG', bio: 'Nurse from El Salvador.', email: "damaris@gmail.com", password: "me1234", password_confirmation: "me1234")
fourth_user = User.create(name: 'Jennifer', photo: 'users/4.PNG', bio: 'Nurse from USA.', email: "jennifer@gmail.com", password: "me1234", password_confirmation: "me1234")
fifth_user = User.create(name: 'Saumira', photo: 'users/5.PNG', bio: 'Journalist from El Salvador.', email: "saumira@gmail.com", password: "me1234", password_confirmation: "me1234")
sixth_user = User.create(name: 'Haydee', photo: 'users/6.PNG', bio: 'Chef from El salvador.', email: "haydee@gmail.com", password: "me1234", password_confirmation: "me1234")

first_user.admin!
second_user.admin!
third_user.admin!

first_post = Post.create(author: first_user, title: 'Hello, I love coding.', text: 'This is my first post, and I\'m thrilled to start this journey into the world of coding. There\'s so much to learn and create, and I can\'t wait to explore all the possibilities that programming offers. Whether it\'s building websites, analyzing data, or creating apps, I\'m here for it all!')
second_post = Post.create(author: first_user, title: 'Hello, I am thinking all day long about space and time complexity.', text: 'This is my second post. Lately, I\'ve been captivated by the intricacies of space and time complexity in algorithms. It\'s fascinating how efficiently a problem can be solved by understanding and applying these concepts. Optimizing code not just for it to work, but for it to work efficiently, is a challenge I\'m eager to tackle.')
third_post = Post.create(author: first_user, title: 'Hello, I want to learn GO and Python', text: 'This is my third post. I\'m setting my sights on learning GO and Python. Both languages have unique strengths - GO with its performance and efficiency in concurrent processes, and Python with its simplicity and vast array of libraries for data analysis, machine learning, and more. It\'s time to dive deep into these languages!')
fourth_post = Post.create(author: second_user, title: 'I am learning Git. What advice would you give me?', text: 'This is my first post on my journey to mastering Git. As a version control system, Git seems indispensable for collaboration and maintaining a clean workflow in projects. I\'m curious about best practices and any advice seasoned developers have to offer to a beginner like myself.')
fifth_post = Post.create(author: second_user, title: 'The most important thing about learning is to "focus" and avoid distractions.', text: 'This is my second post. In my journey of learning new skills, I\'ve realized that focus is the key ingredient. It\'s not just about the hours you put in, but also the quality of those hours. Minimizing distractions and maximizing deep, focused work can lead to profound learning experiences.')
sixth_post = Post.create(author: second_user, title: 'Hello, what are you learning?', text: 'This is my third post. I\'m on a quest to keep improving myself and am curious to know what others are learning. Whether it\'s a new programming language, a hobby, or a soft skill, I believe we can inspire each other by sharing our learning journeys.')
seventh_post = Post.create(author: third_user, title: 'Hello, it is very important to take supplements in case you are not eating well in case you want to be a high performer developer.', text: 'This is my first post. Balancing health and work is crucial, especially in demanding fields like software development. Sometimes, our diet lacks certain nutrients, and that\'s where supplements can play a role. They can help fill the gaps and ensure our body gets everything it needs to function optimally.')
eighth_post = Post.create(author: third_user, title: 'Hello, I specialize in helping developers take good care of themselves.', text: 'This is my second post. As a health consultant for developers, I understand the unique challenges faced by individuals in this profession. Prolonged hours in front of the computer can take a toll. I\'m here to share tips on physical and mental well-being tailored for the developer lifestyle.')
ninth_post = Post.create(author: third_user, title: 'Hello, what supplements are you taking?', text: 'This is my third post. I\'m curious to learn about the supplements that fellow developers take to maintain their health and boost performance. Sharing our routines might help us discover new supplements and create a balanced approach to health and nutrition.')
tenth_post = Post.create(author: fourth_user, title: 'Hello, how many hours do you sleep? In case you want to be a healthy developer you must sleep well.', text: 'This is my first post. Sleep is non-negotiable for peak performance, especially in fields that require intense mental activity like software development. I aim for 7-9 hours of quality sleep and am interested in learning about your sleep habits and tips for a restful night.')
eleventh_post = Post.create(author: fourth_user, title: 'Hello, how many hours are you sitting each day?', text: 'This is my second post. The sedentary lifestyle of a developer is a concern for many. I try to incorporate movement into my day, whether it\'s a standing desk, regular stretching, or short walks. How do you tackle the challenge of sitting for extended periods?')
twelfth_post = Post.create(author: fourth_user, title: 'Hello, how do you take care of your mental health?', text: 'This is my third post. Mental health is paramount, and as developers, the cognitive load can be quite heavy. I prioritize mindfulness and breaks to clear my mind. I\'d love to hear about the strategies you use to maintain mental clarity and well-being.')
thirteenth_post = Post.create(author: fifth_user, title: 'Hello, I will teach you how to create a cool personal brand!', text: 'This is my first post. Personal branding is more important than ever in the digital age. It\'s about showcasing your unique skills and personality. I\'ll share insights and tips on how to build a personal brand that stands out and resonates with your audience.')
fourteenth_post = Post.create(author: fifth_user, title: 'Hello, how do you use social media to promote your personal brand?', text: 'This is my second post. Social media is a powerful tool for personal branding. But it\'s not just about being present; it\'s about engaging meaningfully with your audience. Let\'s discuss strategies to effectively use social media to enhance your personal brand.')
fifteenth_post = Post.create(author: fifth_user, title: 'Hello, how are you taking advantage of technology to promote yourself?', text: 'This is my third post. Technology offers numerous platforms and tools for self-promotion. From blogging to podcasting, there are countless ways to share your knowledge and skills. I\'m curious about the innovative ways you use technology for personal branding.')
sixteenth_post = Post.create(author: sixth_user, title: 'Hello, I will teach you what to eat in case you want to be a high performer!', text: 'This is my first post. Nutrition plays a critical role in performance, especially for tasks that require intense mental focus. I\'ll share diet tips and meal plans that can help boost cognitive function and overall productivity.')
seventeenth_post = Post.create(author: sixth_user, title: 'Hello, I will guide you step by step to avoid obesity.', text: 'This is my second post. Obesity prevention is crucial, and I\'m here to provide you with a step-by-step guide on how to maintain a healthy weight. It\'s not just about diet; it\'s about lifestyle changes that last a lifetime.')
eighteenth_post = Post.create(author: sixth_user, title: 'Hello, always eat your vegetables!', text: 'This is my third post. Vegetables are a cornerstone of a good health.')


# Create Likes
users = [first_user, second_user, third_user, fourth_user, fifth_user, sixth_user]
posts = [first_post, second_post, third_post, fourth_post, fifth_post, sixth_post, seventh_post, eighth_post, ninth_post, tenth_post, eleventh_post, twelfth_post, thirteenth_post, fourteenth_post, fifteenth_post, sixteenth_post, seventeenth_post, eighteenth_post]

# Specify the number of likes for each post
number_of_likes_per_post = 10

posts.each do |post|
  users.sample(number_of_likes_per_post).each do |user|
    Like.create(user: user, post: post)
  end
end

puts "Created #{posts.size * number_of_likes_per_post} likes."
