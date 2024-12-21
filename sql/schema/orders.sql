-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id SERIAL PRIMARY KEY,                                     -- Unique ID for each order
    customer_id INT NOT NULL,                                        -- Customer placing the order
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                  -- Order date and time
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0),  -- Total order amount
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE                                            -- Delete orders when customer is deleted
);

