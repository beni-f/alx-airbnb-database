-- Select Database
USE airbnb_database;

-- Perfrom Inner Join
SELECT *
FROM Booking
INNER JOIN User
ON Booking.user_id = User.user_id;

-- Perform Left Join
SELECT *
FROM Property
LEFT JOIN Review
ON Property.property_id = Review.property_id
ORDER BY Property.name ASC;

-- Perfrom Full Outer Join
SELECT *
FROM User
LEFT JOIN Booking
ON User.user_id = Booking.user_id

UNION

SELECT *
FROM User
RIGHT JOIN Booking
ON User.user_id = Booking.user_id;
