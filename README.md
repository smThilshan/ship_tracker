# ship_tracker

A new Flutter project.

# Mobile App Developer Assignment

## Overview
This mobile app provides insights into the shipping progress of customer orders. Developed using the Flutter framework, it includes a login screen, a dashboard for statistics, an orders section, location tracking, and push notifications.

## Installation Instructions
To set up and run this application locally, follow these steps:

1. **Clone the Repository**
   
   git clone (https://github.com/smThilshan/ship_tracker)
   cd (https://github.com/smThilshan/ship_tracker)

2. **Install Dependencies**

    flutter pub get


3. **Run the App**

    flutter run

4. **Firebase Setup**


5. **Mock Server Setup**

Open Postman and sign in to your account.

Create a New Mock Server:

Click on the New button in the top left corner and select Mock Server.
Select Collection:

Choose an existing collection or create a new one for your API endpoints.
Configure Mock Server:

Set the environment and choose the authentication method if needed.
Copy the Mock Server URL:

After creating the mock server, copy the URL for use in your application.
Configure App to Use Mock Server:

In your app, update the API endpoints to point to the mock server URL.flutter run

### Overview of the App Features


1. Login Screen: Allows users to log in using their merchant account details.

2. Loading Page: Displays the loading.

3. Dashboard View: Displays order statistics, finance statistics, and status statistics using appropriate widgets.

4. Orders Section: 

- View Orders by Status: Lists orders based on their status.
- Download Orders: Allows downloading orders as Excel files.
- View & Add Remarks: Users can view remarks and add new ones to orders.

5. Order Location Tracking: Displays the order transportation location using the Google Maps API.

6. Push Notifications: Sends notifications when an order status is updated using Firebase services.

#### Covered and Uncovered Aspects

**Covered Features:**

1. Login Functionality: Implemented with email and password fields.

2. Dashboard Widgets: Created widgets for order, finance and statistics.

3. Order Tracking: Created the Class.

4. View Orders: Functionality to view the orders is included.

5. Push Notifications: Basic setup for push notifications upon order status updates.

**Uncovered Features:**

1. Download Orders as Excel Files: The feature was not implemented due to time constraints, as it requires integration with Firestore for storage and additional libraries for Excel generation.

2. Full Order Status Management: A complete implementation requires more extensive testing and user interface considerations.

3. Order Tracking System: Need more details and time to implement the order tracking system

4. Push Notification: I have just deployed the UI component without automated functionality due to time is not enough

5. Full API Integration: To complete the all API requires more extensive testing and time to learn and execute

##### Note

While I have implemented basic API functionalities using mock servers and have experience with data handling, I do not have extensive experience in developing APIs from scratch. However, I am eager to learn and improve my skills in this area. The implementation of API features in this project is based on available documentation and resources.

And I don't have much more experience on Bloc so I have used Provider. Incase Bloc pattern is must i am eager to learn and execute the company needs.