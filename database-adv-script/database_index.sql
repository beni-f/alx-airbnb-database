-- Select Database
USE airbnb_database;

-- Index on User email (used for fast lookup)
CREATE INDEX idx_user_email ON User(email);

-- Index on User user_id (used for JOIN operations with Booking, Review, and Message tables)
CREATE INDEX idx_user_user_id ON User(user_id);

-- Index on Property property_id (used for JOIN operations with Booking, Review tables)
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Index on Property host_id (used for JOIN operations with the User table)
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Index on Booking booking_id (used for JOIN operations with Payment table)
CREATE INDEX idx_booking_booking_id ON Booking(booking_id);

-- Index on Booking user_id (used for JOIN operations with the User table)
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on Booking property_id (used for JOIN operations with the Property table)
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Check the performance of a query to join User and Booking tables
EXPLAIN ANALYZE
SELECT U.user_id, U.first_name, B.booking_id, B.start_date
FROM User U
INNER JOIN Booking B ON U.user_id = B.user_id
WHERE U.role = 'guest';

-- Check the performance of a query to retrieve properties based on location
EXPLAIN ANALYZE
SELECT property_id, name, price_per_night
FROM Property
WHERE location = 'New York';

-- Check the performance of a query to get the most booked properties
EXPLAIN ANALYZE
SELECT property_id, COUNT(*) AS booking_count
FROM Booking
GROUP BY property_id
ORDER BY booking_count DESC
LIMIT 10;
