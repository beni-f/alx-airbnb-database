 -- Practice Subqueries

 -- Select Database
 USE airbnb_database;

 -- A Query to find all properties where the average rating is greater than 4.0 using a subquery.
 SELECT *
 FROM Property
 WHERE (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
 );

 -- A correlated subquery to find users who have made more than 3 bookings
 SELECT *
 FROM User
 WHERE 
    (SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.user_id)  > 3;
