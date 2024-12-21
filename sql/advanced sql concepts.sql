--TASK 4: Advanced SQL Concepts

-- 1. Joins:
-- Write queries using INNER JOIN, LEFT JOIN, and FULL JOIN to retrieve data across multiple tables.

-- Inner Join
-- Retrieve customer details and their orders
-- This query will return the names of customers along with the order details only for those customers who have placed orders.
SELECT 
    c.name, 
    o.order_id, 
    o.order_date, 
    o.total_amount
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;


-- Left Join
-- Retrieve all customers and their orders (including customers with no orders)
-- This query will return all customers, whether they have placed orders or not. If a customer hasn't placed any orders, the order details will be NULL.
SELECT 
    c.name, 
    o.order_id, 
    o.order_date, 
    o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;


-- Full Join
-- Retrieve all customers and all orders, whether or not there's a match
-- This query will return all customers and all orders. If a customer has no orders, the order details will be NULL. 
-- Similarly, if there are orders with no matching customers (e.g., orphaned orders), those will also be included with NULL values for the customer details.
SELECT 
    c.name, 
    o.order_id, 
    o.order_date, 
    o.total_amount
FROM Customers c
FULL JOIN Orders o ON c.customer_id = o.customer_id;


-- Retrieve order details including customer name and product name
-- This query will return the customer name, order details, product names, quantities, and the total cost for each product in the order.
SELECT 
    c.name,
    o.order_id,
    o.order_date,
    oi.quantity,
    p.product_name,
    oi.price * oi.quantity AS total_product_cost
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id   -- Join Orders and Customers
INNER JOIN Order_Items oi ON o.order_id = oi.order_id     -- Join Orders and Order_Items
INNER JOIN Products p ON oi.product_id = p.product_id;    -- Join Order_Items and Products


-- 2. Window Functions:
-- Use RANK() to rank customers based on their total spending.
SELECT 
    c.customer_id, 
    c.name, 
    SUM(oi.price * oi.quantity) AS total_spending,
    RANK() OVER (ORDER BY SUM(oi.price * oi.quantity) DESC) AS spending_rank
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY spending_rank;

-- Use ROW_NUMBER() to assign a unique number to each order for a customer.
SELECT 
    o.order_id, 
    o.customer_id, 
    o.order_date,
    ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date) AS order_number
FROM Orders o
ORDER BY o.customer_id, order_number;


-- 3. CTEs and Subqueries:
-- Use a Common Table Expression (CTE) to calculate the total revenue per customer, then find the customers with revenue greater than $500.
WITH Customer_Revenue AS (
    SELECT 
        o.customer_id, 
        SUM(oi.price * oi.quantity) AS total_revenue
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
)
SELECT 
    c.customer_id, 
    c.name, 
    cr.total_revenue
FROM Customers c
JOIN Customer_Revenue cr ON c.customer_id = cr.customer_id
WHERE cr.total_revenue > 500
ORDER BY cr.total_revenue DESC;


-- Write a subquery to find the product with the highest price.
SELECT 
    p.product_id, 
    p.product_name, 
    p.price
FROM Products p
WHERE p.price = (
    SELECT MAX(price) 
    FROM Products
);


-- 4. Indexing:
-- Create indexes on frequently queried fields (e.g., customer_id, product_id) and demonstrate their impact on query performance.
-- Index on customer_id in the Orders table:
CREATE INDEX idx_orders_customer_id ON Orders (customer_id);

-- Index on product_id in the Order_Items table:
CREATE INDEX idx_order_items_product_id ON Order_Items (product_id);

-- Index on order_id in the Order_Items table:
CREATE INDEX idx_order_items_order_id ON Order_Items (order_id);

-- Index on order_item_id in the Order_Items table:
CREATE INDEX idx_order_items_order_item_id ON Order_Items (order_item_id);


-- PS
-- To demonstrate the impact of these indexes, I will execute two queries: one before creating indexes and another after creating indexes as seen in the optimization sql file.



