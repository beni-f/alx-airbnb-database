-- Select database
USE airbnb_database;

-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
    ('1', 'Alice', 'Smith', 'alice@example.com', 'hashed_password1', '1234567890', 'guest', NOW()),
    ('2', 'Bob', 'Johnson', 'bob@example.com', 'hashed_password2', '0987654321', 'host', NOW()),
    ('3', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password3', NULL, 'admin', NOW());

-- Insert sample data into the Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
    ('101', '2', 'Cozy Apartment', 'A lovely apartment in the city center.', 'New York', 150.00, NOW(), NOW()),
    ('102', '2', 'Beach House', 'A spacious house with a beach view.', 'California', 250.00, NOW(), NOW());

-- Insert sample data into the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES 
    ('201', '101', '1', '2024-12-01', '2024-12-05', 600.00, 'confirmed', NOW()),
    ('202', '102', '1', '2025-01-10', '2025-01-15', 1250.00, 'pending', NOW());

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
    ('301', '201', 600.00, NOW(), 'credit_card'),
    ('302', '202', 1250.00, NOW(), 'paypal');

-- Insert sample data into the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
    ('401', '101', '1', 5, 'Amazing place! Highly recommend.', NOW()),
    ('402', '102', '1', 4, 'Great view but a bit pricey.', NOW());

-- Insert sample data into the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
    ('501', '1', '2', 'Hi, is the apartment available for December?', NOW()),
    ('502', '2', '1', 'Yes, it is available. Please let me know if you want to book.', NOW());
