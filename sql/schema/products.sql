-- Create the Products table
CREATE TABLE IF NOT EXISTS Products (
    product_id SERIAL PRIMARY KEY,          -- Unique ID for each product
    product_name VARCHAR(100) NOT NULL,     -- Product name (required)
    category VARCHAR(50) NOT NULL,          -- Product category (required)
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),  -- Price (must be non-negative)
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)  -- Stock quantity (non-negative)
);


