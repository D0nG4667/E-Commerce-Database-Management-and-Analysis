--Insert sample data into Products
INSERT INTO Products (product_name, category, price, stock_quantity)
VALUES
('Laptop', 'Electronics', 999.99, 50),
('Headphones', 'Electronics', 49.99, 200),
('Coffee Maker', 'Appliances', 79.99, 100),
('Smartphone', 'Electronics', 799.99, 150),
('Wireless Mouse', 'Accessories', 19.99, 300),
('Gaming Chair', 'Furniture', 149.99, 75),
('Bluetooth Speaker', 'Electronics', 59.99, 120),
('Air Purifier', 'Appliances', 129.99, 60),
('Smartwatch', 'Electronics', 199.99, 80),
('Keyboard', 'Accessories', 29.99, 250),
('Electric Kettle', 'Appliances', 39.99, 140),
('Desk Lamp', 'Furniture', 49.99, 90),
('Tablet', 'Electronics', 399.99, 130),
('Office Chair', 'Furniture', 169.99, 110),
('Electric Toothbrush', 'Health', 59.99, 170),
('Shredder', 'Office Supplies', 69.99, 80),
('Vitamins', 'Health', 19.99, 400),
('Washing Machine', 'Appliances', 499.99, 45),
('Printer', 'Office Supplies', 99.99, 60),
-- Adding out-of-stock products
('Monitor', 'Electronics', 149.99, 0),
('Blender', 'Appliances', 89.99, 0),
('Fitness Tracker', 'Health', 79.99, 0);


--PS
--select * from products;
--drop table products;
