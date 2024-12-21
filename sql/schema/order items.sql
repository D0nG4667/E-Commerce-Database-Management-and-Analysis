-- Create the Order items table
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,                  -- Unique ID for each order item
    order_id INT NOT NULL,                             -- Associated order
    product_id INT NOT NULL,                           -- Associated product
    quantity INT NOT NULL CHECK (quantity > 0),        -- Quantity ordered (must be positive)
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),  -- Price per unit (must be non-negative)
    CONSTRAINT fk_order
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE,                             -- Delete order items when order is deleted
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON DELETE CASCADE                              -- Delete order items when product is deleted
);

