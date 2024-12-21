-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
  	customer_id SERIAL PRIMARY KEY,        -- Unique ID for each customer
	name VARCHAR(100) NOT NULL,            -- Customer name (required)
	email VARCHAR(100) UNIQUE NOT NULL,    -- Email (unique and required)
	phone_number VARCHAR(15) NOT NULL,     -- Phone number (required)
    address text
);




