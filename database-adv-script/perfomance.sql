-- Optimize Complex Queries

-- Select Database
USE airbnb_database;

-- An initial query that retrieves all bookings along  with the user details, property details, and payment detais
EXPLAIN
SELECT *
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id IS NOT NULL
AND b.property_id IS NOT NULL
AND (pay.booking_id IS NOT NULL OR pay.booking_id IS NULL);

-- After analyzing it uses indexes as a reference so we can really say that performance is optimized.


-- Refactored Query 
SELECT *
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.user_id IS NOT NULL
AND b.property_id IS NOT NULL
AND (pay.booking_id IS NOT NULL OR pay.booking_id IS NULL);