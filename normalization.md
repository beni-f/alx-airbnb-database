# Normalizing the Database Design

# Objective
- Apply normalization principles to ensure the database is in the third normal form(3NF)

# Review
## Database Schema Before Normalization

### User Table

| Column Name    | Data Type  | Constraints                        |
|----------------|------------|-------------------------------------|
| user_id        | UUID       | Primary Key, Indexed               |
| first_name     | VARCHAR    | NOT NULL                           |
| last_name      | VARCHAR    | NOT NULL                           |
| email          | VARCHAR    | UNIQUE, NOT NULL                   |
| password_hash  | VARCHAR    | NOT NULL                           |
| phone_number   | VARCHAR    | NULL                               |
| role           | ENUM       | (guest, host, admin), NOT NULL     |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP          |

---

### Property Table

| Column Name    | Data Type  | Constraints                             |
|----------------|------------|------------------------------------------|
| property_id    | UUID       | Primary Key, Indexed                    |
| host_id        | UUID       | Foreign Key, references User(user_id)   |
| name           | VARCHAR    | NOT NULL                                |
| description    | TEXT       | NOT NULL                                |
| location       | VARCHAR    | NOT NULL                                |
| pricepernight  | DECIMAL    | NOT NULL                                |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP               |
| updated_at     | TIMESTAMP  | ON UPDATE CURRENT_TIMESTAMP             |

---

### Booking Table

| Column Name    | Data Type  | Constraints                                |
|----------------|------------|---------------------------------------------|
| booking_id     | UUID       | Primary Key, Indexed                       |
| property_id    | UUID       | Foreign Key, references Property(property_id)|
| user_id        | UUID       | Foreign Key, references User(user_id)      |
| start_date     | DATE       | NOT NULL                                   |
| end_date       | DATE       | NOT NULL                                   |
| total_price    | DECIMAL    | NOT NULL                                   |
| status         | ENUM       | (pending, confirmed, canceled), NOT NULL   |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                  |

---

### Payment Table

| Column Name    | Data Type  | Constraints                                |
|----------------|------------|---------------------------------------------|
| payment_id     | UUID       | Primary Key, Indexed                       |
| booking_id     | UUID       | Foreign Key, references Booking(booking_id)|
| amount         | DECIMAL    | NOT NULL                                   |
| payment_date   | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                  |
| payment_method | ENUM       | (credit_card, paypal, stripe), NOT NULL    |

---

### Review Table

| Column Name    | Data Type  | Constraints                                |
|----------------|------------|---------------------------------------------|
| review_id      | UUID       | Primary Key, Indexed                       |
| property_id    | UUID       | Foreign Key, references Property(property_id)|
| user_id        | UUID       | Foreign Key, references User(user_id)      |
| rating         | INTEGER    | CHECK rating >= 1 AND rating <= 5, NOT NULL|
| comment        | TEXT       | NOT NULL                                   |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                  |

---

### Message Table

| Column Name    | Data Type  | Constraints                                |
|----------------|------------|---------------------------------------------|
| message_id     | UUID       | Primary Key, Indexed                       |
| sender_id      | UUID       | Foreign Key, references User(user_id)      |
| recipient_id   | UUID       | Foreign Key, references User(user_id)      |
| message_body   | TEXT       | NOT NULL                                   |
| sent_at        | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                  |

- After reviewing, there are no transitive dependencies withing the tables. However, there could be few areas that could be restructured better to achieve 4NF and 5NF. This are:
    - Extract Payment Methods into a separate table
        - Payment methods were stored as ENUM. Instead, Create a PaymentMethod table for extensibility.
    - Extract status in Booking table into a separate table.
        - The status attribute in Booking was an ENUM. It can also be stored in a seprate table for extensibility
    - Location Redundancy in Property
        - If the location attribute in Property is resued across multiple properties (e.g., same city or region), normalize it into a Location table.
