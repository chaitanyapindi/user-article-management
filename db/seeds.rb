# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clear existing records (optional)
User.destroy_all

# Define seed data for users with passwords
users = [
  {
    username: "chaitup",
    phone_number: "+18506317411",
    email: "chaitanya@gmail.com",
    password: "password123"
  },
  {
    username: "psaisowjanya",
    phone_number: "+18503453127",
    email: "psaisowjanya@gmail.com",
    password: "password456"
  },
  {
    username: "chaitanyapindi",
    phone_number: "+18506667539",
    email: "chaitanyap@gmail.com",
    password: "password789"
  },
  {
    username: "sahithiv",
    phone_number: "+19013503580",
    email: "sahithiv@gmail.com",
    password: "passwordabc"
  } 
]

# Create users with passwords
users.each do |user|
  User.create!(
    username: user[:username],
    phone_number: user[:phone_number],
    email: user[:email],
    password: user[:password], # Devise will handle encryption
    password_confirmation: user[:password] # Devise expects password_confirmation too
  )
end

puts "Seed data for users with passwords successfully created!"

# Clear existing records (optional)
Article.destroy_all

# Define seed data
articles = [
  {
    title: "Getting Started with Ruby on Rails",
    text: "Learn the basics of Ruby on Rails framework and how to set up your first application.",
    created_at: "2024-06-18 14:19:06",
    updated_at: "2024-06-18 14:19:06",
    user_id: 1
  },
  {
    title: "Integrating Real-Time SMS Notifications",
    text: "Explore how to integrate real-time SMS notifications using popular APIs like Twilio or ClickSend.",
    created_at: "2024-06-18 15:42:39",
    updated_at: "2024-06-18 15:42:39",
    user_id: 2
  },
  {
    title: "Enhancing User Engagement with SMS Sharing",
    text: "Discover how SMS sharing can enhance user engagement by providing instant updates and notifications.",
    created_at: "2024-06-18 16:01:22",
    updated_at: "2024-06-18 16:01:22",
    user_id: 3
  },
  {
    title: "Building a Personal Blog with User Authentication",
    text: "Create a personal blog where users can authenticate, create, update, and delete their own articles.",
    created_at: "2024-06-18 23:43:31",
    updated_at: "2024-06-18 23:43:31",
    user_id: 1
  },
  {
    title: "Implementing Real-Time Updates in Rails",
    text: "Test whether a message is being shared with users when blog content is updated.",
    created_at: "2024-06-19 01:04:46",
    updated_at: "2024-06-19 01:05:55",
    user_id: 1
  },
  {
    title: "Enhanced User Experience with Sign-in/Sign-out Notifications",
    text: "Track user activities with sign-in and sign-out notifications for better user engagement.",
    created_at: "2024-06-19 01:44:05",
    updated_at: "2024-06-19 01:44:05",
    user_id: 2
  },
  {
    title: "Keeping Users Informed: Notification Strategies",
    text: "Ensure users are informed about every update and event through effective notification strategies.",
    created_at: "2024-06-19 02:02:10",
    updated_at: "2024-06-19 02:02:10",
    user_id: 3
  },
  {
    title: "Optimizing Dashboard Performance for Message Display",
    text: "Improve dashboard performance to efficiently display shared messages and updates.",
    created_at: "2024-06-19 03:33:15",
    updated_at: "2024-06-19 03:33:15",
    user_id: 1
  },
  {
    title: "Becoming a Real-Time Database Administrator",
    text: "Develop essential database skills to become proficient in real-time database administration.",
    created_at: "2024-06-19 04:04:55",
    updated_at: "2024-06-19 04:04:55",
    user_id: 4
  }
]

# Create articles
articles.each do |article|
  Article.create!(article)
end

puts "Seed data for articles successfully created!"

# Clear existing records (optional)
Message.destroy_all

# Seed data for messages
messages = [
  {
    to: "+18506317411",
    body: "Hey chaitup ! A new article with 'Getting Started with Ruby on Rails' title is created.",
    status: "success",
    created_at: "2024-06-19 03:33:16",
    updated_at: "2024-06-19 03:33:16"
  },
  {
    to: "+18506317411",
    body: "Hi chaitup, you have successfully signed out.",
    status: "success",
    created_at: "2024-06-19 03:45:38",
    updated_at: "2024-06-19 03:45:38"
  },
  {
    to: "+19013503580",
    body: "Welcome sahithiv! Thank you for registering.",
    status: "success",
    created_at: "2024-06-19 03:59:58",
    updated_at: "2024-06-19 03:59:58"
  },
  {
    to: "+19013503580",
    body: "Hey sahithiv ! A new article with 'Becoming a Real-Time Database Administrator' title is created.",
    status: "success",
    created_at: "2024-06-19 04:04:56",
    updated_at: "2024-06-19 04:04:56"
  }
]

# Create messages
messages.each do |message|
  Message.create!(message)
end

puts "Seed data for messages successfully created!"


# Clear existing records (optional)
Comment.destroy_all

# Seed data for comments
comments = [
  {
    commenter: "psaisowjanya",
    body: "Have you tested sharing a text with commenter and author when a new comment is added?",
    article_id: 3,
    created_at: "2024-06-19 00:49:50",
    updated_at: "2024-06-19 00:49:50"
  },
  {
    commenter: "chaitup",
    body: "Testing comment deletion and addition text messages.",
    article_id: 5,
    created_at: "2024-06-19 01:52:13",
    updated_at: "2024-06-19 01:52:13"
  },
  {
    commenter: "sahithiv",
    body: "Are the messages properly being displayed in the dashboard?",
    article_id: 6,
    created_at: "2024-06-19 04:26:24",
    updated_at: "2024-06-19 04:26:24"
  }
]

# Create comments
comments.each do |comment|
  Comment.create!(comment)
end

puts "Seed data for comments successfully created!"
