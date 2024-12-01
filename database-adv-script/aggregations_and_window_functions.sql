-- Apply Aggregations and Window Functions

-- Select Database
USE airbnb_database;

-- A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
SELECT COUNT(*)
FROM Booking
GROUP BY Booking.user_id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) as booking_rank
FROM Property p
LEFT JOIN Booking b
ON p.property_id = b.property_id
GROUP BY p.property_id
ORDER BY booking_rank;
