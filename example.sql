-- Create a test table
CREATE TABLE test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Insert sample data
INSERT INTO test_table (name, age) VALUES ('Alice', 30);
INSERT INTO test_table (name, age) VALUES ('Bob', 25);
INSERT INTO test_table (name, age) VALUES ('Charlie', 35);
