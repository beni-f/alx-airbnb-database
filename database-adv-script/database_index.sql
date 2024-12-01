
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

