-- TASK 2: CRUD Operations


-- 1. Add a New Customer to the Database
-- This query will insert a new customer named John Doe with the specified contact details.
INSERT INTO Customers (name, email, phone_number, address)
VALUES
('John Doe', 'john.doe@example.com', '555-987-1234', '123 New St, Los Angeles, CA 90001');


-- 2. Update the Stock Quantity of a Product After a Purchase
-- This query will reduce the stock_quantity of the product with product_id = 1 (Laptop) by 1 after a purchase.
UPDATE Products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;


-- 3. Delete an Order from the Database
-- This query will delete the order with order_id = 10 from the Orders table.
DELETE FROM Orders
WHERE order_id = 10;


-- 4. Retrieve All Orders Made by a Specific Customer
-- This query will return all the orders placed by Emma Wilson (Customer ID 5), including the order_id, order_date, and total_amount.
SELECT o.order_id, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE c.customer_id = 5;


-- PS
-- DELETE FROM Customers WHERE email = 'john.doe@example.com';



