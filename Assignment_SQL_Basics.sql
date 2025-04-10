create database courses;
use courses;

-- 1. Create a table called employees with the following structure?
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(255) UNIQUE,
    salary DECIMAL(10, 2) DEFAULT 30000.00
);

select * from employees;

-- Q2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide examples of common types of 
 -- constraints.
-- Ans: Purpose of Constraints in a Database--

-- Constraints are essential rules enforced on data columns in a table to ensure the accuracy and reliability of the data within the database.
-- They play a crucial role in maintaining data integrity by restricting the type, range, and format of the data that can be inserted into 
-- the database. Here are some of the key purposes of constraints:

-- 1 Data Integrity: Constraints ensure that the data stored in the database is accurate and consistent.
-- 2 Data Validation: Constraints validate data before it is inserted or updated, preventing invalid data from being stored.
-- 3 Referential Integrity: Constraints enforce relationships between tables, ensuring that the references between tables are valid and consistent.
-- 4 Ensuring Uniqueness: Constraints can enforce the uniqueness of data in specified columns, preventing duplicate values.

-- Common Types of Constraints:--------------

-- PRIMARY KEY Constraint
-- Purpose: Uniquely identifies each record in a table.
-- Example:
-- CREATE TABLE employees (
--     emp_id INT NOT NULL PRIMARY KEY,
--     emp_name VARCHAR(255) NOT NULL
-- );

-- FOREIGN KEY Constraint
-- Purpose: Ensures referential integrity between two tables by creating a link between the primary key of one table and the foreign key of another table.
-- Example:
-- CREATE TABLE orders (
--     order_id INT NOT NULL PRIMARY KEY,
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- );

-- UNIQUE Constraint
-- Purpose: Ensures that all values in a column are unique.
-- Example:
-- CREATE TABLE users (
--     user_id INT NOT NULL PRIMARY KEY,
--     email VARCHAR(255) UNIQUE
-- );

-- NOT NULL Constraint
-- Purpose: Ensures that a column cannot have a NULL value.
-- Example:
-- CREATE TABLE products (
--     product_id INT NOT NULL PRIMARY KEY,
--     product_name VARCHAR(255) NOT NULL
-- );

-- CHECK Constraint
-- Purpose: Ensures that all values in a column satisfy a specific condition.
-- Example:
-- CREATE TABLE employees (
--     emp_id INT NOT NULL PRIMARY KEY,
--     age INT CHECK (age >= 18)
-- );

-- DEFAULT Constraint
-- Purpose: Provides a default value for a column when no value is specified.
-- Example:
-- CREATE TABLE employees (
--     emp_id INT NOT NULL PRIMARY KEY,
--     salary DECIMAL(10, 2) DEFAULT 30000.00

-- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

-- Why Apply the NOT NULL Constraint---------------------------------
-- Ensures Data: Ensures essential data is present.
-- Prevents Nulls: Avoids null values in critical fields.
-- Simplifies Logic: Simplifies application logic by avoiding NULL checks

-- Can a Primary Key Contain NULL Values--------------------------------
-- No, A primary key must be unique, Ensures referential integrity and must uniquely identify each record.

-- 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and
 --   removing a constraint.
 
 -- Adding a Constraint-------------
--  ALTER TABLE table_name
--  ADD CONSTRAINT constraint_name PRIMARY KEY (column1, column2, ...);
--  ALTER TABLE employees
--  ADD CONSTRAINT pk_employee PRIMARY KEY (employee_id);

-- Removing a Constraint-------------------------------------
-- ALTER TABLE table_name
-- DROP CONSTRAINT constraint_name;
-- ALTER TABLE employees
-- DROP CONSTRAINT pk_employee;

--  Q5 Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.Provide an example of an
--  error message that might occur when violating a constraint.

-- Consequences of Violating Constraints

-- 1. PRIMARY KEY Constraint:
-- Insert: If you try to insert a duplicate value into a column with a PRIMARY KEY constraint, you'll get an error.
-- Update: If an update operation results in a duplicate key value, the update will fail.
-- Delete: Deleting a primary key value can affect related tables if foreign keys are involved.

-- 2. FOREIGN KEY Constraint:
-- Insert: Trying to insert a value that doesn't exist in the referenced table will result in an error.
-- Update: Updating a foreign key value to something that doesn't exist in the referenced table will fail.
-- Delete: Deleting a row that is referenced by a foreign key in another table will fail unless the foreign key constraint is set to
--  CASCADE.

-- 3. UNIQUE Constraint:
-- Insert/Update: Attempting to insert or update a value that already exists in a column with a UNIQUE constraint will result in an error.

-- 4. CHECK Constraint:
-- Insert/Update: Trying to insert or update a value that doesn't satisfy the CHECK condition will fail.

--  Example---

CREATE TABLE employees (
   employee_id INT PRIMARY KEY,
   name VARCHAR(100),
   department_id INT
);

INSERT INTO employees (employee_id, name, department_id)
VALUES (1, 'Zayn', 101);

INSERT INTO employees (employee_id, name, department_id)
VALUES (1, 'Danze', 102);

-- ERROR: duplicate key value violates unique constraint "employees_pkey"
-- DETAIL: Key (employee_id)=(1) already exists.

-- 6. You created a products table without constraints as follows:

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
    
-- Now, you realise that?
-- : The product_id should be a primary keyQ
-- : The price should have a default value of 50.00

-- Ans. We have already created the table but we want to update the table format then we will use the alter commands.Pls find below the 
-- quiries for this regarding...

-- Adding PRIMARY KEY constraint
ALTER TABLE products
ADD CONSTRAINT pk_product PRIMARY KEY (product_id);

-- Setting default value for price column
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

drop table products;

-- Q7. You have two tables:

create table students(
student_id int primary key,
student_name varchar(30),
class_id int);

Insert into students ( student_id, student_name, class_id )
value ( 1, 'Alice' , 101),
	  (2,'Bob', 102),
      (3, 'Charlie', 101);

Select * from students;

Create table classes (
class_id int primary key, 
class_name varchar(30));
    
Insert into classes (  class_id,   class_name)
Values (101, 'Match'),
       (102,'Science'), 
       (103,'History');
       
Select * from classes;  
Select * from students;  

-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
  
SELECT 
    Students.student_name, 
    Classes.class_name
FROM 
    Students
INNER JOIN 
	Classes
ON 
    Students.class_id = Classes.class_id;
       
-- 8. Consider the following three tables:

Create table orders (
order_id int primary key,
order_date date ,
customer_id int ); 

insert into orders ( order_id, order_date, customer_id)
            value ( 1, '2024-01-01', 101),
				  (2, '2024-01-03', 102);
                    
select * from orders;    
                    
create table customers(
customer_id int primary key,
customer_name varchar(30) );    

insert into customers ( customer_id, customer_name)
values (101,'Alice'), (102, 'Bob');

select * from customers;   

create table products (
product_id int primary key,
product_name varchar(40),
order_id  int );

insert into products ( product_id, product_name, order_id )
values (1, 'Laptop', 1), ( 2,'Phone',null);

select * from products;   
drop table products;
-- Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
-- listed even if they are not associated with an order 
-- Hint: (use INNER JOIN and LEFT JOIN).

SELECT 
	o.order_id, c.customer_name, p.product_name 
FROM
	Products p 
LEFT JOIN 
	Orders o ON p.order_id = o.order_id 
LEFT JOIN 
	Customers c ON o.customer_id = c.customer_id;

-- Q9. Given the following tables:

  create table sales (
  sale_id int primary key,
  product_id int ,
  amount int  );
  
  insert into sales (  sale_id,  product_id , amount)
  values ( 1, 101, 500), (2, 102, 300), ( 3, 101, 700);
  
  select * from sales;
  
  create table products (
  product_id int primary key,
  product_name varchar(300));
  
  insert into products (product_id,  product_name)
              values(101, 'Laptop'), (102, 'Phone');
              
   select * from products;
   
   
  --  Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
             
SELECT 
    p.product_name, 
    SUM(s.amount) AS total_sales_amount
FROM 
    sales s
INNER JOIN 
    products p ON s.product_id = p.product_id
GROUP BY 
    p.product_name;
 
-- Q10. You are given three tables:

create table orders (
order_id int primary key,
order_date date , 
customer_id int);

INSERT INTO orders (order_id, order_date, customer_id) VALUES (1, '2024-01-02', 1), (2, '2024-01-05', 2); 
select * from orders;

DROP TABLE IF EXISTS customers;

create table customers(
customer_id int primary key , 
customer_name varchar(30));

select * from customers; 

insert into customers( customer_id, customer_name) values (1,'Alice'), (2, 'Bob');
select * from customers; 

create table Order_Details (
Order_id int ,
product_id int ,
quantity int);


select * from Order_Details; 

insert into Order_Details ( Order_id, product_id, quantity) values 
(1, 101, 2), (1, 102,1), (2, 101,3);

-- Write a query to display the order_id, customer_name, and the quantity of products ordered by each
-- customer using an INNER JOIN between all three tables.
-- Note - The above-mentioned questions don't require any dataset.

SELECT 
    o.order_id, 
    c.customer_name, 
    od.quantity
FROM 
    orders o
INNER JOIN 
    customers c ON o.customer_id = c.customer_id
INNER JOIN 
    Order_Details od ON o.order_id = od.order_id;

  
  -- -----------------------------------SQL Commands--------------------------------------
  create schema mavenmovie;
  USE mavenmovie;
    
-- Q1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences.
-- Primary Keys (PK):
-- actor: actor_id
-- actor_award: actor_award_id
-- address: address_id
-- advisor: advisor_id
-- category: category_id
-- city: city_id
-- country: country_id
-- customer: customer_id
-- film: film_id
-- film_actor: (actor_id, film_id) - Composite Primary Key
-- film_category: (film_id, category_id) - Composite Primary Key
-- film_text: film_id
-- inventory: inventory_id
-- investor: investor_id
-- language: language_id
-- payment: payment_id
-- staff: staff_id
-- store: store_id

-- Foreign Keys (FK):
-- actor_award: actor_id (refers to actor(actor_id))
-- address: city_id (refers to city(city_id))
-- customer: store_id (refers to store(store_id)), address_id (refers to address(address_id))
-- film: language_id (refers to language(language_id)), original_language_id (refers to language(language_id))
-- film_actor: actor_id (refers to actor(actor_id)), film_id (refers to film(film_id))
-- film_category: film_id (refers to film(film_id)), category_id (refers to category(category_id))
-- inventory: film_id (refers to film(film_id)), store_id (refers to store(store_id))
-- payment: customer_id (refers to customer(customer_id)), staff_id (refers to staff(staff_id)), rental_id (refers to inventory(inventory_id))
-- staff: address_id (refers to address(address_id)), store_id (refers to store(store_id))
-- store: manager_staff_id (refers to staff(staff_id)), address_id (refers to address(address_id))

-- Differences:
-- Primary Keys uniquely identify each record within their respective tables and cannot contain NULL values.
-- Foreign Keys establish relationships between tables and can contain NULL values if the relationship is optional. Foreign keys reference 
--          primary keys in other tables.

-- 2- List all details of actors    
SELECT * FROM Actors;

-- 3 -List all customer information from DB.
SELECT * FROM Customers;

-- 4 -List different countries.
SELECT DISTINCT country FROM Customers;

-- 5 -Display all active customers.
SELECT * FROM Customers 
WHERE status = 'active';

-- 6 -List of all rental IDs for customer with ID 1.
SELECT rental_id FROM Rentals 
WHERE customer_id = 1;

-- 7 - Display all the films whose rental duration is greater than 5 .
SELECT * FROM Films 
WHERE rental_duration > 5;

-- 8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) FROM Films 
WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) FROM Actors;

-- 10- Display the first 10 records from the customer table .
SELECT * FROM Customers LIMIT 10;

-- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM Customers 
WHERE first_name LIKE 'b%' LIMIT 3;

-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
SELECT title FROM Movies 
WHERE rating = 'G' LIMIT 5;

-- 13-Find all customers whose first name starts with "a".
SELECT * FROM Customers 
WHERE first_name LIKE 'a%';

-- 14- Find all customers whose first name ends with "a".
SELECT * FROM Customers 
WHERE first_name LIKE '%a';

-- 15- Display the list of first 4 cities which start and end with ‘a’ .
SELECT DISTINCT city FROM Customers 
WHERE city LIKE 'a%' AND city LIKE '%a' 
LIMIT 4;

-- 16- Find all customers whose first name have "NI" in any position.
SELECT * FROM Customers 
WHERE first_name LIKE '%NI%';

-- 17- Find all customers whose first name have "r" in the second position .
SELECT * FROM Customers 
WHERE first_name LIKE '_r%';

-- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
SELECT * FROM Customers 
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- 19- Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM Customers 
WHERE first_name LIKE 'a%o';

-- 20 - Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM Films 
WHERE rating IN ('PG', 'PG-13');

-- 21 - Get the films with length between 50 to 100 using between operator.
SELECT * FROM Films 
WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
SELECT * FROM Actors LIMIT 50;

-- 23 - Get the distinct film ids from inventory table.
SELECT DISTINCT film_id FROM Inventory;


-- ----------------------------------------------------FUNCTIONS------------------------------------------------


------------- Basic Aggregate Functions:-- -------

-- Question 1: Retrieve the total number of rentals made in the Sakila database.
-- Hint: Use the COUNT() function.
	
    SELECT COUNT(*) AS total_rentals FROM rental;

-- Question 2: Find the average rental duration (in days) of movies rented from the Sakila database.
-- 			Hint: Utilize the AVG() function.

    SELECT AVG(rental_duration) AS average_rental_duration FROM rental;
    
    -- String Functions:

-- Question 3: Display the first name and last name of customers in uppercase.
--              Hint: Use the UPPER () function.
   
   SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper FROM customer;
   
   
-- Question 4:Extract the month from the rental date and display it alongside the rental ID.
--         Hint: Employ the MONTH() function.
       
	SELECT rental_id, MONTH(rental_date) AS rental_month FROM rental;

-- -------------------------------- GROUP BY:----------------------------------------------------

-- Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
--      Hint: Use COUNT () in conjunction with GROUP BY.

   SELECT customer_id, COUNT(*) AS rental_count FROM rental 
   GROUP BY customer_id;

-- Question 6: Find the total revenue generated by each store.
--         Hint: Combine SUM() and GROUP BY.

   SELECT store_id, SUM(amount) AS total_revenue FROM 
   payment GROUP BY store_id;
   
-- Question 7:Determine the total number of rentals for each category of movies.
-- 	Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
 
	SELECT c.name AS category_name, COUNT(*) AS total_rentals
	FROM rental r
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	JOIN film_category fc ON f.film_id = fc.film_id
	JOIN category c ON fc.category_id = c.category_id
	GROUP BY c.name;
   
-- Question 8: Find the average rental rate of movies in each language.
--        Hint: JOIN film and language tables, then use AVG () and GROUP BY.

	SELECT l.name AS language_name, AVG(f.rental_rate) AS average_rental_rate
	FROM film f
	JOIN language l ON f.language_id = l.language_id
	GROUP BY l.name;
	   
-- Questions 9 - Display the title of the movie, customer s first name, and last name who rented it.
--   Hint: Use JOIN between the film, inventory, rental, and customer tables.

	SELECT 
		f.title, 
		c.first_name, 
		c.last_name
	FROM 
		film f
	JOIN 
		inventory i ON f.film_id = i.film_id
	JOIN 
		rental r ON i.inventory_id = r.inventory_id
	JOIN 
		customer c ON r.customer_id = c.customer_id;


-- Question 10: Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
--            Hint: Use JOIN between the film actor, film, and actor tables.

	SELECT 
		a.first_name, 
		a.last_name
	FROM 
		actor a
	JOIN 
		film_actor fa ON a.actor_id = fa.actor_id
	JOIN 
		film f ON fa.film_id = f.film_id
	WHERE 
		f.title = 'Gone with the Wind';


-- Question 11: Retrieve the customer names along with the total amount they've spent on rentals.
-- Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.

	SELECT 
		c.first_name, 
		c.last_name, 
		SUM(p.amount) AS total_amount_spent
	FROM 
		customer c
	JOIN 
		payment p ON c.customer_id = p.customer_id
	GROUP BY 
		c.first_name, 
		c.last_name;

-- Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
--  Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.

		SELECT 
			c.first_name, 
			c.last_name, 
			f.title
		FROM 
			customer c
		JOIN 
			address a ON c.address_id = a.address_id
		JOIN 
			city ct ON a.city_id = ct.city_id
		JOIN 
			rental r ON c.customer_id = r.customer_id
		JOIN 
			inventory i ON r.inventory_id = i.inventory_id
		JOIN 
			film f ON i.film_id = f.film_id
		WHERE 
			ct.city = 'London'
		GROUP BY 
			c.first_name, 
			c.last_name, 
			f.title;

-- -----------------------------------------Advanced Joins and GROUP BY:------------------------------

-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
--  Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.

	SELECT 
		f.title, 
		COUNT(r.rental_id) AS rental_count
	FROM 
		film f
	JOIN 
		inventory i ON f.film_id = i.film_id
	JOIN 
		rental r ON i.inventory_id = r.inventory_id
	GROUP BY 
		f.title
	ORDER BY 
		rental_count DESC
	LIMIT 5;
    
-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
--          Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

 SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name
FROM 
    customer c
JOIN 
    rental r1 ON c.customer_id = r1.customer_id
JOIN 
    inventory i1 ON r1.inventory_id = i1.inventory_id
JOIN 
    store s1 ON i1.store_id = s1.store_id
JOIN 
    rental r2 ON c.customer_id = r2.customer_id
JOIN 
    inventory i2 ON r2.inventory_id = i2.inventory_id
JOIN 
    store s2 ON i2.store_id = s2.store_id
WHERE 
    s1.store_id = 1 AND s2.store_id = 2
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name;
    
-- -------------------------------------Windows Function:------------------------------------------------   

-- 1. Rank the customers based on the total amount they've spent on rentals. 

SELECT 
    customer_id, 
    first_name, 
    last_name, 
    SUM(amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(amount) DESC) AS customer_rank
FROM 
    payment
JOIN 
    customer ON payment.customer_id = customer.customer_id
GROUP BY 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name;
    
-- 2. Calculate the cumulative revenue generated by each film over time.    

SELECT 
    f.film_id, 
    f.title, 
    p.payment_date, 
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id;

-- 3. Determine the average rental duration for each film, considering films with similar lengths.

SELECT 
    f.film_id, 
    f.title, 
    f.length, 
    AVG(r.rental_duration) OVER (PARTITION BY f.length) AS average_rental_duration
FROM 
    film f
JOIN 
    rental r ON f.film_id = r.inventory_id;
    
-- 4. Identify the top 3 films in each category based on their rental counts.

SELECT 
    fc.category_id, 
    c.name AS category_name, 
    f.film_id, 
    f.title, 
    COUNT(r.rental_id) AS rental_count,
    RANK() OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id) DESC) AS film_rank
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id
GROUP BY 
    fc.category_id, 
    c.name, 
    f.film_id, 
    f.title
HAVING 
    RANK() OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id) DESC) <= 3;
    
-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.

WITH CustomerRentals AS (
    SELECT 
        customer_id, 
        COUNT(*) AS total_rentals
    FROM 
        rental
    GROUP BY 
        customer_id
),
AverageRentals AS (
    SELECT 
        AVG(total_rentals) AS average_rentals
    FROM 
        CustomerRentals
)
SELECT 
    cr.customer_id, 
    cr.total_rentals, 
    ar.average_rentals, 
    cr.total_rentals - ar.average_rentals AS rental_difference
FROM 
    CustomerRentals cr
CROSS JOIN 
    AverageRentals ar;

-- 6. Find the monthly revenue trend for the entire rental store over time.

SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    SUM(amount) AS monthly_revenue
FROM 
    payment
GROUP BY 
    DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY 
    month;


-- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.

WITH CustomerSpending AS (
    SELECT 
        customer_id, 
        SUM(amount) AS total_spent
    FROM 
        payment
    GROUP BY 
        customer_id
),
CustomerPercentiles AS (
    SELECT 
        customer_id, 
        total_spent,
        NTILE(5) OVER (ORDER BY total_spent DESC) AS spending_percentile
    FROM 
        CustomerSpending
)
SELECT 
    customer_id, 
    total_spent
FROM 
    CustomerPercentiles
WHERE 
    spending_percentile = 1;


-- 8. Calculate the running total of rentals per category, ordered by rental count.

SELECT 
    c.name AS category_name, 
    f.title, 
    COUNT(r.rental_id) OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id)) AS running_total
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    c.name, 
    f.title
ORDER BY 
    c.category_id, 
    running_total;

-- 9. Find the films that have been rented less than the average rental count for their respective categories.

WITH FilmRentalCounts AS (
    SELECT 
        f.film_id, 
        f.title, 
        c.name AS category_name, 
        COUNT(r.rental_id) AS rental_count
    FROM 
        film f
    JOIN 
        film_category fc ON f.film_id = fc.film_id
    JOIN 
        category c ON fc.category_id = c.category_id
    JOIN 
        inventory i ON f.film_id = i.film_id
    JOIN 
        rental r ON i.inventory_id = r.inventory_id
    GROUP BY 
        f.film_id, 
        f.title, 
        c.name
),
CategoryAverages AS (
    SELECT 
        category_name, 
        AVG(rental_count) AS average_rental_count
    FROM 
        FilmRentalCounts
    GROUP BY 
        category_name
)
SELECT 
    fr.title, 
    fr.category_name, 
    fr.rental_count, 
    ca.average_rental_count
FROM 
    FilmRentalCounts fr
JOIN 
    CategoryAverages ca ON fr.category_name = ca.category_name
WHERE 
    fr.rental_count < ca.average_rental_count;

-- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.

SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month, 
    SUM(amount) AS monthly_revenue
FROM 
    payment
GROUP BY 
    DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY 
    monthly_revenue DESC
LIMIT 5;


-- ----------------------------------------------Normalisation & CTE---------------------------------------

-- 1. First Normal Form (1NF):
--  a. Identify a table in the Sakila database that violates 1NF. Explain how you
--  would normalize it to achieve 1NF.

-- Violation of 1NF:
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    address VARCHAR(50),
    address2 VARCHAR(50),
    district VARCHAR(50),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(50) -- Multiple phone numbers stored as comma-separated values
);

-- Normalization to 1NF:

CREATE TABLE phone_numbers (
    phone_id INT PRIMARY KEY,
    address_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- 2. Second Normal Form (2NF):
--  a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
--  If it violates 2NF, explain the steps to normalize it.

-- Violation of 2NF:

CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(50),
    store_id INT,
    store_name VARCHAR(50) -- Partially dependent on store_id
);

-- Normalization to 2NF:

CREATE TABLE store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50)
);

CREATE TABLE film (
    film_id INT PRIMARY KEY,
    title VARCHAR(50),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

-- 3. Third Normal Form (3NF):
--  a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
--  present and outline the steps to normalize the table to 3NF.

-- Violation of 3NF:
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    customer_name VARCHAR(50) -- Transitively dependent on customer_id
);

-- Normalization to 3NF:

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- 4. Normalization Process:
--  a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
--  unnormalized form up to at least 2NF.

-- Unnormalized Form:

CREATE TABLE CustomerOrders (
    customer_id INT,
    customer_name VARCHAR(50),
    orders VARCHAR(255) -- Orders stored as a comma-separated list
);

-- 1NF: Remove repeating groups:

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- 5. CTE Basics:
--  a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and 
--    film_actor tables.

WITH ActorFilmCountCTE AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, 
        a.first_name, 
        a.last_name
)
SELECT 
    first_name,
    last_name,
    film_count
FROM 
    ActorFilmCountCTE
ORDER BY 
    film_count DESC;

-- 6. CTE with Joins:
-- a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate

WITH FilmLanguageCTE AS (
    SELECT 
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)
SELECT 
    film_title, 
    language_name, 
    rental_rate
FROM 
    FilmLanguageCTE;

-- 7.CTE for Aggregation:
--  a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment 
-- tables.

WITH CustomerRevenueCTE AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM 
        customer c
    JOIN 
        payment p ON c.customer_id = p.customer_id
    GROUP BY 
        c.customer_id, 
        c.first_name, 
        c.last_name
)
SELECT 
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM 
    CustomerRevenueCTE;

-- 8. CTE with Window Functions:
 -- a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
 
 WITH FilmDurationRankCTE AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM 
        film
)
SELECT 
    film_id,
    title,
    rental_duration,
    duration_rank
FROM 
    FilmDurationRankCTE;
    
    
-- 9.CTE and Filtering:
--  a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve 
--  additional customer details.

WITH CustomerRentalsCTE AS (
    SELECT 
        customer_id,
        COUNT(*) AS rental_count
    FROM 
        rental
    GROUP BY 
        customer_id
    HAVING 
        COUNT(*) > 2
)
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    cr.rental_count
FROM 
    CustomerRentalsCTE cr
JOIN 
    customer c ON cr.customer_id = c.customer_id;

-- 10.CTE for Date Calculations:
-- a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.

WITH MonthlyRentalsCTE AS (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(*) AS total_rentals
    FROM 
        rental
    GROUP BY 
        DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT 
    rental_month,
    total_rentals
FROM 
    MonthlyRentalsCTE
ORDER BY 
    rental_month;

-- 11.CTE and Self-Join:
-- a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.

WITH ActorPairsCTE AS (
    SELECT 
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM 
        film_actor fa1
    JOIN 
        film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE 
        fa1.actor_id < fa2.actor_id
)
SELECT 
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    ap.film_id
FROM 
    ActorPairsCTE ap
JOIN 
    actor a1 ON ap.actor1_id = a1.actor_id
JOIN 
    actor a2 ON ap.actor2_id = a2.actor_id
ORDER BY 
    ap.film_id, 
    actor1_first_name, 
    actor2_first_name;

-- 12.CTE for Recursive Search:
-- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to 
-- column.

WITH RecursiveStaffCTE AS (
    SELECT 
        staff_id,
        first_name,
        last_name,
        reports_to
    FROM 
        staff
    WHERE 
        reports_to = 1 -- Replace 1 with the specific manager's staff_id

    UNION ALL

    SELECT 
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM 
        staff s
    INNER JOIN 
        RecursiveStaffCTE r ON s.reports_to = r.staff_id
)
SELECT 
    staff_id,
    first_name,
    last_name,
    reports_to
FROM 
    RecursiveStaffCTE
ORDER BY 
    reports_to, 
    staff_id;

-- ------------------Assignment Completed------------------------------------------------------------
