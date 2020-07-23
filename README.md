# NovaRegistrationFrontEnd
Front end system for our Nova Room Registration app. 
This repository stores all the front end work on for the app.

# Summary
We sought out to create a working iOS application that allowed you to book a room from Nova’s available buildings, as long as you had the prerequisites like being a part of Razor’s Edge and the room not being full. 
We accomplished this by storing the information on a MySQL database and creating web APIs, both of which were hosted on Amazon Web Services, and having the front-end Swift application call these APIs and get both student and dorm information from the database as well as update the database tables with new information when reserving a room. 
We had succeeded in creating a working iOS front end with functioning API calls, with a working database.


# Sign In screen
Here is our sign in screen. Here we make an API call to our login API and check student creditials to log them into the application.
The 'Sign In' page view controller consists of two text fields that take in the username and password and a button that signs you in.
On click of the 'Sign In' button, we call the Login API and it checks your creditials and either signs you in or returns false. 

 
![Sign In Screen](./loginPageHome.png)

# Home Page
Here is our home page. Here the user has the ability to access the profile page, book a room page, or the review room reservation page. 


![Home Page](./homePage.png)

# Book Room Page


![Book Room Page](./BookRoom.png)

# Profile Page
The profile page view controller loads basic information about the student such as their first and last name, sex, and grade level

![Profile Page](./ProfilePage.png)

# Room Reservation Page


![Room Reservation Page](./RoomReservationReview.png)

# List of APIs


![API's](./APIs.jpg)



