------ Vehicle Rental ------

This database consists of three tables: Users, Vehicles and Bookings.



 1. Users
Primary Key (PK): u_id

### 2. Vehicles
Primary Key (PK): v_id

### 3. Bookings
Primary Key (PK):b_id
Foreign Key (FK):
user_id → references users(u_id)
vehicle_id → references vehicles(v_id)

 Relationships
- One user  have multiple bookings
- One vehicle  have multiple bookings
- Foreign keys ensure data integrity between tables
