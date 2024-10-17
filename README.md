# Railway Reservation System

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview
The Railway Reservation System is a simple console-based application that allows users to book, cancel, and view train tickets. The system provides functionalities for passengers to check train availability, book tickets, and view reservation statuses. It is designed to help users manage railway reservations more efficiently.

## Features
- **User Registration and Login**: Users can create accounts and log in to manage their reservations.
- **Search and View Trains**: Users can search for available trains based on source and destination stations.
- **Ticket Booking**: Allows users to book train tickets.
- **Ticket Cancellation**: Users can cancel their previously booked tickets.
- **View Booking History**: Displays the list of tickets booked by the user.
- **Admin Dashboard**: Allows admin users to add or update train details, manage train schedules, and view all bookings.

## Technologies Used
- **Programming Language**: Java
- **Database**: MySQL (for storing user information, train details, and reservations)
- **Frameworks/Libraries**: JDBC for database connectivity
- **IDE**: Eclipse/IntelliJ IDEA (optional)

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/anrao0037/RailwayReservationSystem.git
   ```

2. **Set Up Database**:
   - Install MySQL or use an online database.
   - Create a new database for the railway reservation system.
   - Run the provided SQL script (`schema.sql`) to set up the required tables.

3. **Configure Database Connection**:
   - Open the project and locate the database configuration file.
   - Update the connection settings (username, password, database name) to match your MySQL setup.

4. **Run the Application**:
   - Import the project into your preferred IDE.
   - Compile and run the main Java file.

## Usage
1. **User Registration**: 
   - New users can register by providing personal details such as name, email, and contact information.
2. **Login**:
   - Users can log in to the system using their registered email and password.
3. **Booking Tickets**:
   - Search for trains between specific source and destination stations, and book tickets if seats are available.
4. **Admin Controls**:
   - Admin users can log in to manage train schedules, update train information, and view user bookings.

## Contributing
If you would like to contribute to this project, feel free to fork the repository, make changes, and submit a pull request. Please ensure that your code follows the existing style guidelines.

