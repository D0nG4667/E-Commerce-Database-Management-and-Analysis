-- TASK 5: optimization
-- Drop Indexes
DROP INDEX idx_orders_customer_id;
DROP INDEX idx_order_items_product_id;
DROP INDEX idx_order_items_order_id;
DROP INDEX idx_order_items_order_item_id;


-- Before creating indexes:
EXPLAIN ANALYZE 
SELECT 
    o.customer_id, 
    p.product_id, 
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.customer_id = 5
GROUP BY o.customer_id, p.product_id
ORDER BY total_revenue DESC;

-- Key Observations:
-- The sequential scans on both Order_Items and Orders tables are not using indexes, which could be optimized if there are indexes on order_id and customer_id.
-- The Nested Loop Join is used, which can be inefficient if the tables are large, but the actual time suggests that the rows involved are small (only 4 rows from Orders after filtering).
-- Index Only Scan on Products is efficient, as it’s using the primary key index to retrieve data.


-- Create Indexes
CREATE INDEX idx_orders_customer_id ON Orders (customer_id);
CREATE INDEX idx_order_items_product_id ON Order_Items (product_id);
CREATE INDEX idx_order_items_order_id ON Order_Items (order_id);
CREATE INDEX idx_order_items_order_item_id ON Order_Items (order_item_id);

-- After creating indexes:
EXPLAIN ANALYZE 
SELECT 
    o.customer_id, 
    p.product_id, 
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE o.customer_id = 5
GROUP BY o.customer_id, p.product_id
ORDER BY total_revenue DESC;

-- Summary of Improvements:
-- The query execution time decreased significantly, with the total execution time dropping to 0.100 ms (from an earlier time of ~0.130 ms).
-- Indexing on customer_id in the Orders table and order_id in the Order_Items table contributed to faster filtering and join operations.
-- The Index Only Scan on the Products table is now much faster, indicating better utilization of the index.
-- Query planning time also decreased slightly (2.936 ms from previous longer planning times), reflecting improved efficiency in generating the execution plan.

-- Further Considerations:
-- Seq Scans on both Orders and Order_Items are still present but are now more optimized. If the tables grow significantly, it would be time to explore covering indexes (indexes that include all columns needed by the query) to eliminate the need for sequential scans entirely.
-- The query is performing well after indexing, but monitoring needs to be continued as data volume increases is advisable.
