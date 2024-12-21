-- House Keeping
-- Login with postgres user or super admin, psql -U postgres
CREATE USER ecommerce_db_user WITH ENCRYPTED PASSWORD 'amazon123'; -- Use your own password

SET ROLE ecommerce_db_user;

CREATE DATABASE ecommerce_db;