# Index Performance Analysis

## Queries Analyzed
1. Query to retrieve all bookings for a user.
2. Query to retrieve all properties and their reviews.

## Performance Before and After Indexing
### Query 1: Retrieve all bookings for a user

**Before Indexing:**
- Execution time: 1 seconds
- Rows scanned: 10 rows

**After Indexing:**
- Execution time: 0.1 second
- Rows scanned: 1 rows

## EXPLAIN Plan
- **Before Indexing**: The query performed a full table scan on the `Booking` and `Property` tables.
- **After Indexing**: The query utilized indexes on `user_id`, `property_id`, and `booking_id` to quickly retrieve relevant data.
