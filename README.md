# Real-Time SMS Notification System with Rails 7

## Project Description

This project demonstrates a Real-Time SMS Notification System built with Ruby on Rails 7. It features a Blog application where users can create articles and comment on others' articles. The system sends real-time SMS notifications in response to specific triggers such as user sign-up, article creation, and comments, showcasing the integration of backend processing and SMS API.

## Installation and Setup

### Prerequisites
Ensure you have Ruby and Rails installed on your machine.

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/chaitanyapindi/blogapp.git
   cd blogapp

2. **Install dependencies**:
   ```bundle install```
  
3. **Set up the database:**:
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed

4. **Configure environment variables**:
    Create a `.env` file in the root directory of the project.
    Add TextBelt SMS API credentials to the .env file.
    ```TEXTBELT_AUTH_TOKEN=your-textbelt-auth-token```

5. **Start the Rails server**:
    ```rails s```

6. Open your web browser and navigate to `http://localhost:3000`.

## Usage
### User Actions and SMS Notifications
- Signup: Sign up as a new user to receive a welcome SMS.
- Login: Log in as an existing user to receive a login SMS.
- Create Article: Create a new article to receive a confirmation SMS.
- Update/Delete Article: Update or delete your article to receive an SMS notification.
- Comment on Article: Comment on any article to receive an SMS. The article's author will also be notified.
- Logout: Log out from the application to receive a sign-out SMS.

## Monitoring SMS Notifications
- Navigate to `http://localhost:3000/dashboard/index` to view all messages sent from the application. The dashboard displays:

    - **Total message count and daily statistics.**
    - **Phone numbers to which messages were sent.**
    - **Message content.**
    - **Message status.**
