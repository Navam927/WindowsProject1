-- Create the FlightReservation database if it doesn't exist
CREATE DATABASE FlightReservation;

-- Switch to the FlightReservation database
USE FlightReservation;

-- Create Flights table
CREATE TABLE Flights (
    flightId INT PRIMARY KEY,
    flightNumber INT,
    departureAirport VARCHAR(20),
    arrivalAirport VARCHAR(20),
    departureDateTime DATETIME,
    arrivalDateTime DATETIME,
    availableSeats INT,
    ticketPrice INT
);

-- Create Customers table
CREATE TABLE Customers (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    email VARCHAR(35),
    password VARCHAR(255), -- Use a secure password hashing algorithm and store hashed passwords
    phoneNumber VARCHAR(15) -- Assuming phone numbers may contain special characters
);

-- Create Bookings table
CREATE TABLE Bookings (
    bookingId INT PRIMARY KEY,
    customerId INT,
    flightId INT,
    bookingDatetime DATETIME,
    paymentStatus VARCHAR(20),
    totalAmount INT,
    FOREIGN KEY (customerId) REFERENCES Customers(customerId),
    FOREIGN KEY (flightId) REFERENCES Flights(flightId)
);

-- Create Passengers table
CREATE TABLE Passengers (
    passengerId INT PRIMARY KEY,
    bookingId INT,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    seatNumber INT,
    FOREIGN KEY (bookingId) REFERENCES Bookings(bookingId)
);

-- Create Payments table
CREATE TABLE Payments (
    paymentId INT PRIMARY KEY,
    bookingId INT,
    paymentDateTime DATETIME,
    paymentAmount INT,
    paymentStatus VARCHAR(20),
    FOREIGN KEY (bookingId) REFERENCES Bookings(bookingId)
);
