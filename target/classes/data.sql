-- Create products table if it doesn't exist
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='products' AND xtype='U')
BEGIN
    CREATE TABLE products (
        id BIGINT IDENTITY(1,1) PRIMARY KEY,
        product_name NVARCHAR(255) NOT NULL,
        product_price DECIMAL(10,2) NOT NULL
    );
END

-- Insert sample data if table is empty
IF NOT EXISTS (SELECT * FROM products)
BEGIN
    INSERT INTO products (product_name, product_price) VALUES 
    ('Sample Product 1', 29.99),
    ('Sample Product 2', 49.99),
    ('Sample Product 3', 99.99);
END
