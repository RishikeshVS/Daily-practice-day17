CREATE TABLE sales (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    sales_amount NUMERIC(10,2),
    sales_date DATE
);
INSERT INTO sales (name, department, salary, sales_amount, sales_date) VALUES
('John Doe', 'Sales', 45000, 75000, '2023-01-15'),
('Jane Smith', 'Marketing', 52000, 60000, '2023-02-20'),
('Mike Johnson', 'Sales', 48000, 90000, '2023-03-10'),
('Emily Brown', 'Marketing', 55000, 65000, '2023-04-05'),
('Sarah Miller', 'Sales', 47000, 85000, '2023-04-15'),
('Robert Black', 'HR', 40000, 20000, '2023-05-01'),
('Emma Davis', 'HR', 42000, 18000, '2023-05-20'),
('David Wilson', 'IT', 60000, 40000, '2023-06-10'),
('Sophia Clark', 'IT', 58000, 45000, '2023-06-15'),
('Liam Martin', 'Marketing', 53000, 70000, '2023-07-05');

select * from sales;


-- Calculate total sales for each department
select department,sum(sales_amount) from sales group by department;

-- Find the average salary per department
select department,avg(salary) from sales group by department;

-- Count the number of employees in each department
select department,count(name) from sales group by department;

-- Find the maximum sales made by any employee in each department
select name,max(sales_amount) from sales group by name;

-- Find departments where average salary is above $50,000
select department from sales group by department having avg(salary)>50000;

-- List departments with more than 2 employees
select department from sales group by department having count(department)>2;

-- List departments with total sales less than $100,000
select department from sales group by department having sum(sales_amount)<100000;

-- Show salary range (min and max) for each department
select department,min(salary),max(salary) from sales group by department;

-- List departments where total sales exceed total salary expense
select department,sum(sales_amount),sum(salary) from sales group by department
having sum(sales_amount)>sum(salary);