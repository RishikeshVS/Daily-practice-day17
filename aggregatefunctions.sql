-- create
CREATE TABLE sales1 (
    id SERIAL PRIMARY KEY,
    item VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price INT
);

-- insert
INSERT INTO sales1 (item, category, quantity, price) VALUES
('Pen',       'Stationery', 10, 5),
('Pencil',    'Stationery', 20, 3),
('Notebook',  'Stationery', 15, 20),
('Apple',     'Fruits',     5, 30),
('Banana',    'Fruits',    10, 10),
('Orange',    'Fruits',     8, 15),
('Glue',      'Stationery', 5, 25),
('Grapes',    'Fruits',     4, 50);

-- select 
select * from sales1;

-- group by
SELECT category, SUM(quantity) 
FROM sales1
GROUP BY category;

-- having
SELECT category, SUM(quantity) 
FROM sales1
GROUP BY category
HAVING SUM(quantity)>30;

-- HAVING without GROUP BY
SELECT SUM(quantity) 
FROM sales1
HAVING SUM(quantity) > 50;

SELECT AVG(price) 
FROM sales1
HAVING AVG(price) < 20;

SELECT MIN(price) 
FROM sales1
HAVING MIN(price) > 2;

SELECT COUNT(*) 
FROM sales1
HAVING COUNT(*) = 8;

SELECT 
    SUM(quantity) AS total_quantity,
    AVG(price) AS average_price
FROM sales1
HAVING SUM(quantity)>50 AND AVG(price)>10;

-- aggregate fns
SELECT COUNT(*) FROM sales1;

SELECT SUM(quantity) FROM sales1;

SELECT AVG(price) FROM sales1;

SELECT MIN(price) FROM sales1;

SELECT MAX(price) FROM sales1;

SELECT category, SUM(quantity)
FROM sales1
GROUP BY category;

SELECT category, AVG(price) 
FROM sales1
GROUP BY category;

SELECT category, COUNT(*) 
FROM sales1
GROUP BY category;

SELECT category, SUM(quantity) 
FROM sales1
GROUP BY category
HAVING SUM(quantity) > 30;

SELECT item, price
FROM sales1
WHERE category = 'Fruits'
ORDER BY price DESC
LIMIT 1;

SELECT item, price
FROM sales1
WHERE category = 'Fruits' AND price = (
    SELECT MAX(price)
    FROM sales1
    WHERE category = 'Fruits'
);

select * from sales1;

-- Count how many items are in the table.
select count(*) from sales1;

-- Find the total quantity of all items sold.
select sum(quantity) from sales1;




-- Find the total quantity sold per category.
select sum(quantity) from sales1 group by category;

-- Find the average price of items in each category.
select category,avg(price) from sales1 group by category;

-- Count how many items exist in each category.
select category,count(item) from sales1 group by category;

-- Find the total number of items per category, and order them by total quantity descending.
select category,sum(quantity) from sales1 group by category order by sum(quantity) desc;

-- Show the highest price per category.
select category,max(price) from sales1 group by category; 




-- Show categories that have a maximum price above 20.
select category from sales1 group by category having max(price)>20;

-- Show categories where the number of items is less than 3.
select category from sales1 group by category having count(item)<3;

-- Show categories where average price is greater than 15.
select category from sales1 group by category having avg(price)>15;

-- Show categories where total quantity sold is more than 25.
select category from sales1 group by category having sum(quantity)>25;

-- Show only those categories that have both more than 2 items and average price greater than 10.
select category,count(*) from sales1 group by category having count(*)>2 and avg(price)>10;

