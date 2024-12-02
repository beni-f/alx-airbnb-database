# Performance Monitoring

## **Step 1: Monitor Query Performance**
1. **Identify Frequently Used Queries** anaylze your application to find the most commonly executed queries (e.g., SELECT, UPDATE, DELETE) that interact with your database.

2. **Use `SHOW PROFILE` or `EXPLAIN ANALYZE`**
-  `SHOW PROFILE`: Provides details on query execution steps and resource usage.
- `EXPLAIN ANALYZE`: Combines query execution plans with actual runtime statstics.

- **Output Analysis**: Check for bottlenecks such as:
    - Full table scans
    - High I/O operations.
    - Unused indexes.

## **Step 2: Identify Bottlenecks**
Using the profiling or execution plan:
1. Look for slow operations (e.g., "Full Table Scan", "Large data tables")
2. Identify if indexes are missing for commonly used `WHERE` or `JOIN` conditions.
3. Determine if the schema can be optimized (e.g., column types, partitions).

## **Step 3: Suggest Changes**
1. **Add Missing Indexes** If a query is scanning the entire table due to missing indexes, add an index to the columns used in `WHERE`, `JOIN` or `ORDER BY`.
    **Example**
    ```sql
        CREATE INDEX idx_booking_start_date ON Booking(start_date);
    ```

2. **Adjust Schema** If the table has redundant columns or lacks normalization, adjust the schema.

    **Example**
    - Split composite columns (e.g., storing date and timie separately if queried independently)
    - Use partitions for large datasets based on frequently queried ranges (e.g., partition by `start_date`).

3. **Optimize Joins** Replace unnecessary `LEFT JOIN`s with `INNER JOIN`s when relationships always exist.

## **Step 4: Implement Changes**
After identifying the optimizations:
1. Apply the changes to the schema or indexes.
2. Re-run the `SHOW PROFILE` or `EXPLAIN ANALYZE` to verify improvements.

## **Step 5: Report Improvements**
**Report Example**

```markdown
Database Performance Report

Initial Analysis
- Query: `SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';`
- Execution Time: 2.5 seconds.
- Issues Identified:
  - Full table scan due to missing index on `start_date`.

Optimizations Applied
1. Added an index on `start_date`:
   ```sql
   CREATE INDEX idx_booking_start_date ON Booking(start_date);
```
```