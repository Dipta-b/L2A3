create database vehicle_rental_site
create table users (
  u_id serial primary key not null,
  name varchar(30) not null,
  email varchar(100) not null unique,
  password varchar(20) not null,
  phonenumber int,
  role varchar(20) not null default 'customer'
);

create table vehicles (
  v_id serial primary key not null,
  vehicle_name varchar(50) not null,
  type varchar(50) not null,
  model varchar(100) not null,
  registration varchar(100) not null unique,
  rental_price int,
  availability varchar(50)
);

create table bookings (
  b_id serial primary key not null,
  user_id int references users (u_id) not null,
  vehicle_id int references vehicles (v_id) not null,
  start_date date not null,
  end_date date,
  booking_status varchar(50) not null,
  total_cost decimal(10, 2)
);

drop table bookings
drop table users
drop table vehicles
INSERT INTO
  users (name, email, password, phonenumber, role)
VALUES
  (
    'Rahim Ahmed',
    'rahim@gmail.com',
    'rahim123',
    1712345678,
    'customer'
  ),
  (
    'Karim Uddin',
    'karim@gmail.com',
    'karim123',
    1812345678,
    'customer'
  ),
  (
    'Ayesha Rahman',
    'ayesha@gmail.com',
    'ayesha123',
    1912345678,
    'customer'
  ),
  (
    'Nusrat Jahan',
    'nusrat@gmail.com',
    'nusrat123',
    1612345678,
    'customer'
  ),
  (
    'Sakib Hasan',
    'sakib@gmail.com',
    'sakib123',
    1512345678,
    'customer'
  ),
  (
    'Tanvir Islam',
    'tanvir@gmail.com',
    'tanvir123',
    1711122233,
    'customer'
  ),
  (
    'Farhana Akter',
    'farhana@gmail.com',
    'farhana123',
    1811122233,
    'customer'
  ),
  (
    'Imran Hossain',
    'imran@gmail.com',
    'imran123',
    1911122233,
    'customer'
  ),
  (
    'Mahmudul Hasan',
    'mahmud@gmail.com',
    'mahmud123',
    1611122233,
    'admin'
  ),
  (
    'Rashida Begum',
    'rashida@gmail.com',
    'rashida123',
    1511122233,
    'customer'
  );

INSERT INTO
  vehicles (
    vehicle_name,
    type,
    model,
    registration,
    rental_price,
    availability
  )
VALUES
  (
    'Toyota Corolla',
    'Car',
    '2018',
    'DHAKA-GA-1234',
    3500,
    'Available'
  ),
  (
    'Toyota Hiace',
    'Microbus',
    '2019',
    'DHAKA-CHA-5678',
    6000,
    'Available'
  ),
  (
    'Honda Civic',
    'Car',
    '2017',
    'DHAKA-GA-4321',
    4000,
    'Booked'
  ),
  (
    'Nissan X-Trail',
    'SUV',
    '2020',
    'DHAKA-HA-8765',
    5500,
    'Available'
  ),
  (
    'Suzuki Alto',
    'Car',
    '2016',
    'DHAKA-KA-2468',
    2500,
    'Available'
  ),
  (
    'Hyundai H1',
    'Microbus',
    '2018',
    'DHAKA-BA-1357',
    6500,
    'Booked'
  ),
  (
    'Toyota Premio',
    'Car',
    '2019',
    'DHAKA-GA-9753',
    3800,
    'Available'
  ),
  (
    'Mitsubishi Pajero',
    'SUV',
    '2017',
    'DHAKA-HA-8642',
    7000,
    'Available'
  ),
  (
    'Suzuki APV',
    'Microbus',
    '2016',
    'DHAKA-CHA-1597',
    5800,
    'Available'
  ),
  (
    'Toyota Axio',
    'Car',
    '2018',
    'DHAKA-GA-7531',
    3200,
    'Booked'
  );

INSERT INTO
  bookings (
    user_id,
    vehicle_id,
    start_date,
    end_date,
    booking_status,
    total_cost
  )
VALUES
  (
    1,
    1,
    '2025-01-05',
    '2025-01-08',
    'Confirmed',
    10500.00
  ),
  (
    2,
    2,
    '2025-01-10',
    '2025-01-12',
    'Confirmed',
    12000.00
  ),
  (
    3,
    3,
    '2025-01-15',
    '2025-01-18',
    'Completed',
    12000.00
  ),
  (
    4,
    4,
    '2025-01-20',
    '2025-01-23',
    'Confirmed',
    16500.00
  ),
  (
    5,
    5,
    '2025-01-22',
    '2025-01-24',
    'Completed',
    5000.00
  ),
  (
    6,
    6,
    '2025-01-25',
    '2025-01-28',
    'Cancelled',
    19500.00
  ),
  (
    7,
    7,
    '2025-02-01',
    '2025-02-04',
    'Confirmed',
    11400.00
  ),
  (
    8,
    8,
    '2025-02-05',
    '2025-02-07',
    'Completed',
    14000.00
  ),
  (
    9,
    9,
    '2025-02-10',
    '2025-02-13',
    'Confirmed',
    17400.00
  ),
  (
    10,
    10,
    '2025-02-15',
    '2025-02-18',
    'Confirmed',
    9600.00
  );

------------------------------QUERIRS--------------------------
--q1
select
  bookings.b_id,
  users.name as customer_name,
  vehicles.vehicle_name,
  bookings.start_date,
  bookings.end_date
from
  users
  inner join bookings on users.u_id = bookings.user_id
  inner join vehicles on bookings.vehicle_id = vehicles.v_id;

--q2__________
select
  *
from
  vehicles
where
  not exists (
    select
      *
    from
      bookings
    where
      bookings.vehicle_id = vehicles.v_id
  )


--q3
select *
from vehicles
where type = 'Car'
  and availability = 'Available';


--q4
select 
    vehicles.vehicle_name,
    count(bookings.b_id) as total_bookings
from vehicles
inner join bookings on vehicles.v_id = bookings.vehicle_id
having count(bookings.b_id) > 2;





