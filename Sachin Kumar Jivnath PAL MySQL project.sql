create database SP;
use SP;



/*----------------------------------------------------DDL Queries----------------------------------------------------------------*/
-- Create the Inventory sales table
create table sales_inventory(itemno int,
itemname varchar(50) not null,
serila_no int primary key,
category varchar(50) not null,
Price float not null);
desc sales_inventory;

-- 1) Can you add a new column called "quantity" of data type INT to the "sales_inventory" table?
alter table sales_inventory add column quantity int;
alter table sales_inventory drop column quantity;

-- 2) How can you modify the data type of the "Price" column from FLOAT to DECIMAL(10, 2)?
alter table sales_inventory modify price decimal(10,2);
alter table sales_inventory modify price float;


-- 3) Is it possible to rename the "category" column to "product_category"?
alter table sales_inventory rename column category to product_category;


-- 4) Can you create a unique constraint on the "itemname" column to ensure no duplicate item names are allowed?
alter table sales_inventory change itemname itemname int unique;
alter table sales_inventory change itemname itemname varchar(50);
desc sales_inventory;

-- 5)How do you drop the "serila_no" primary key constraint from the table?
alter table sales_inventory drop primary key; 
alter table sales_inventory change serila_no  serial_no int primary key;

-- 6) Can you modify the length of the "itemname" column to allow a maximum of 100 characters?
alter table sales_inventory modify itemname varchar(100);
desc sales_inventory;

-- 7) How can you add a new column called "sales_date" with a data type of DATE to track the date of sale?
alter table sales_inventory add column sales_date date;

-- 8) Is it possible to change the name of the "sales_inventory" table to "purchase_inventory"?
rename table sales_inventory to purchase_inventory;
desc purchase_inventory;

-- 9) Is it possible to rename the "sales_date" column to "purchasse_date"?
alter table purchase_inventory rename column sales_date to purchase_date; 

-- 10) rename column itemno to product_no
alter table purchase_inventory rename column itemno  to product_NO;

-- 11) rename column itemname to  product_name
alter table purchase_inventory rename column itemname  to product_name;
desc purchase_inventory;

-- 12) drop unique constraints from column name 
SHOW INDEX FROM purchase_inventory WHERE non_unique = 0 AND Column_name = 'product_name'; -- using this query we can find of key name. 
ALTER TABLE purchase_inventory
DROP index 	itemname ; -- here itemname is my unique key name and my product_name is columname so using itemname with index we can drop unique constraints
desc purchase_inventory;

-- Creating Employees_info table
create table Employees_info (
Emp_id int primary key auto_increment,
emp_name varchar(50) not null,
emp_dept varchar(50) not null,
city varchar(50),
contact int);

-- creating AssetInventory table

create table AssetInventory(
AssetNo int unique,
assetname varchar(50) not null,
modelname varchar(50)not null,
serial_no int,
category varchar(50),
emp_id int,
foreign key (serial_no) references purchase_inventory(serial_no),
foreign key (emp_id) references Employees_info(Emp_id));
desc AssetInventory;
drop  table AssetInventory;


/*------------------------------------------------> DML <---------------------------------------------------------------------*/


desc purchase_inventory;

insert into purchase_inventory(
product_NO,
product_name,
serial_no,
product_category,
price,
purchase_date) values
(1,'Lenovo',123456,'laptop',22000.567,'2012-09-07'),
(2,'Dell',253679,'Dektop',40000.00,'2016-11-30'),
(3,'HP',387652,'DESKTOP',34999.99,'2011-06-21'),
(4,'Lenovo',443289,'Laptop',100000.00,'2023-09-06'),
(5,'Dell',508765,'Laptop',60000.123,'2016-11-15'),
(6,'Acer',634256,'Laptop',55000.87,'2017-01-01'),
(7,'HP',764108,'Desktop',49000.00,'2018-03-16'),
(8,'Dell',897287,'Monitor',15000.90,'2021-05-19'),
(9,'HP',941987,'Laptop',9999.00,'2022-02-28'),
(10,'Lenovo',1036274,'Laptop',20000.00,'2012-12-12'),
(11,'Dell',1137463,'laptop',12000.567,'2016-01-07'),
(12,'Acer',1232309,'Monitor',90000.00,'2013-01-30'),
(13,'Macbook',1356456,'Laptop',230000.99,'2021-09-21'),
(14,'Macmini',1432090,'Desktop',200000.00,'2023-09-06'),
(15,'Mac',1589888,'Desktop',600000.123,'2019-11-15'),
(16,'OMEN',1646274,'Laptop',55000.87,'2012-11-21'),
(17,'HP',1741822,'Desktop',49000.00,'2014-04-16'),
(18,'Dell',1856287,'Monitor',15000.90,'2023-08-29'),
(19,'HP',1919876,'Laptop',99999.00,'2020-06-28'),
(20,'Lenovo',2062741,'Laptop',20000.00,'2022-02-12');

select* from purchase_inventory;

desc Employees_info;

insert into Employees_info(emp_name,emp_dept,city,contact)
values('Siddhesh Jadhav','Data Scientist','Ghatkoper',123456),
('Sachin Pal','ML engineer','Thane',234567),
('Shreeyash Venkande','AI engineer','Asangaon',237653),
('Rohit Jaiswal','Data Analyst','Airoli',344567),
('Vishal Singh','Data engineer','Badlapur',876544),
('Aquib Khan','IT engineer','Mumbra',765431),
('Sameer Pardhi','Software Developer','Badlapur',987652),
('Lakmipriya Murli','Data Analyst','Kalyan',212432),
('Samiksha Katkar','ML engineer','Nerul',234986),
('Hindavi Pawar','Data Scientist','Mumbai',5342763),
('Omakr Patil','Data Engineer','Kalwa',904567),
('Jayesh Patil','AI engineer','Jalgaon',234567),
('Jawwad','IT engineer','Thane',973541),
('Prathamesh Rathod','Data Scientist','Ghatkoper',7357242),
('Yash Jadhav','ML engineer','Thane',327373),
('Vinay Rao','Support engineer','Pune',847632),
('Abhishek Pardhi','Web developer','Nashik',353742),
('Akshay Rathod','AI & ML engineer','Panvel',736254),
('Sahil Peje','Hacker','Mulund',2324567),
('Munna Bhaiya','Katta Developer','Mirzapur',276432);
select * from Employees_info;

desc Assetinventory;

insert into Assetinventory(AssetNo,assetname,modelname,serial_no,category,emp_id)
values(1,'Lenovo','Yoga',123456,'laptop',1),
(2,'Dell','Optiplex 1010',253679,'Desktop',2),
(3,'HP','Envy',387652,'DESKTOP',3),
(4,'Lenovo','ThinkPad',443289,'laptop',4),
(5,'Dell','Inspiron',508765,'laptop',5),
(6,'Acer','Swift',634256,'laptop',6),
(7,'HP','Pavilion',764108,'Desktop',7),
(8,'Dell','Dell',897287,'Monitor',8),
(9,'HP','Essentials',941987,'laptop',9),
(10,'Lenovo','Thinkpad',1036274,'laptop',10),
(11,'Dell','Inspiron',1137463,'laptop',11),
(12,'Acer','Acer',1232309,'Monitor',12),
(13,'Macbook','Pro',1356456,'laptop',13),
(14,'Macmini','Mac',1432090,'Desktop',14),
(15,'Mac','Mac',1589888,'Desktop',15),
(16,'OMEN','HP',1646274,'laptop',16),
(17,'HP','Pavilion',1741822,'Desktop',17),
(18,'Dell','Dell',1856287,'Monitor',18),
(19,'HP','Essentials',1919876,'laptop',19),
(20,'Lenovo','Yoga',2062741,'laptop',20);
select * from Assetinventory;


/*-------------------------------------------------------Update Queries------------------------------------------------*/
 select * from purchase_inventory;
 -- 1) Can you update the price of a specific item in the "purchase_inventory" table?
 update  purchase_inventory set price  = 23000.7 where product_NO = 1; 
 
 select * from Employees_info;
 -- 2) How can you change the department of an employee in the "Employees_info" table?
 update Employees_info set emp_dept = 'Data Analyst' where Emp_id = 6;
 
 -- 3) Is it possible to update the city of an employee in the "Employees_info" table based on their Emp_id?
 update Employees_info set city = 'Jaunpur' where Emp_id = 20;
 
 
 select * from assetinventory;
 -- 4) How do you update the model name of a particular asset in the "AssetInventory" table?
 update assetinventory set modelname = 'Pavilion' where AssetNo = 3;
 
 -- 5) Can you modify the category of assets that belong to a specific employee in the "AssetInventory" table?
 update assetinventory set category  =  'Mini Desktop' where Emp_id  = 15;
 
 -- 6) How can you update the contact information of an employee in the "Employees_info" table?
 update Employees_info set contact = '9004575' where emp_id = 2;
 
 -- 7) Is it possible to change the item name of a specific item in the "purchase_inventory" table?
 select * from purchase_inventory;
 update purchase_inventory set product_name = 'HP' where product_no = 16;
 
 
 -- 8)Can you update the asset name for assets with a certain category in the "AssetInventory" table?
 update assetinventory set  assetname = 'HP' where category = 'laptop' and assetno = 16;
 
 update assetinventory set  Modelname = 'Omen' where category = 'laptop' and assetno = 16;
 
 /*-------------------------------------------------- Where Clause------------------------------------------------*/
--  Retrieve all employees who work in the "Data Analyst" department.
select * from Employees_info;
select * from Employees_info where emp_dept = 'Data Analyst';

select * from Employees_info where emp_dept = 'Data Scientist';
select * from Employees_info where emp_dept = 'ML engineer';

/*--------------------------------------------------- Operators------------------------------------------------*/
-- Find all assets with a purchase price equal to 20000.
select * from purchase_inventory where price  = 20000;

-- List all items in the "purchase_inventory" table with a price greater than 25000.
select * from purchase_inventory where price  > 25000;

-- Retrieve all items in the "purchase_inventory" table with prices between 25000 and 70000.
select * from purchase_inventory where price  between 25000 and 70000;

-- Get a list of employees in the "Employees_info" table who work in either the "Ml engineer" or "Data Scientist" departments.
select * from Employees_info where emp_dept in ('ML engineer','Data Scientist');

-- Find all assets in the "AssetInventory" table that do not belong to employees with Emp_ids 1, 2, or 3.
select * from assetinventory where emp_id not in (1,2,3);

-- Retrieve all items in the "purchase_inventory" table whose names contain the word "no."
select * from purchase_inventory where product_name like '%no%';

-- List all employees in the "Employees_info" table whose names start with the letter "S."
select * from Employees_info where emp_name like 'S%';


/*----------------------------------------------------Order by ----------------------------------------------------*/
-- Retrieve a list of items in the "purchase_inventory" table sorted by their prices in ascending order.
select * from purchase_inventory order by price ;

-- Find the highest-priced item in the "purchase_inventory" table.
select * from purchase_inventory order by price desc limit 1 ;

-- List employees in the "Employees_info" table sorted by their names in alphabetical order.
select * from employees_info order by emp_name;

-- Find the oldest assets in the "Purchase_Inventory" table based on their purchase year.
select * from purchase_inventory order by purchase_date limit 1;

-- Sort assets in the "AssetInventory" table by their model names in descending order.
select * from assetinventory order by modelname desc;

/*------------------------------------------------------Distinct--------------------------------------------------------*/
--  Get a list of unique categories from the "purchase_inventory" table.
select distinct(product_category) from purchase_inventory;

-- Find all distinct city names where employees in the "Employees_info" table reside.
select distinct(city) from employees_info;

-- Retrieve a list of unique asset names from the "AssetInventory" table.
select distinct(assetname) from AssetInventory;


/*--------------------------------------------------------TOP/LIMIT-------------------------------------------------------*/
-- Retrieve the top 5 items with the highest prices in the "purchase_inventory" table.
select * from purchase_inventory order by price desc limit 5;

-- Find the three oldest assets in the "Purchase_Inventory" table based on their purchase year.
select * from purchase_inventory order by purchase_date limit 3;

/*-------------------------------------------------------->Built In Function<----------------------------------------------*/

/*-------------------->String Function<------------------*/
-- Retrieve a list of employee names from the "Employees_info" table, converting all names to lowercase.
select lower(emp_name) from Employees_info;

-- Find all items in the "purchase_inventory" table where the item name contains the word "el" (case-insensitive).
SELECT * FROM purchase_inventory;
select lower(Product_name) from purchase_inventory  where product_name like '%el%';

-- Extract the first two characters from the "itemname" column for all items in the "purchase_inventory" table.
select left(product_name,2) as First_two from purchase_inventory; -- first approach

select substr(product_name,1,3) as first_two from purchase_inventory; -- Second approach

-- Concatenate the "emp_name" and "city" columns from the "Employees_info" table to create a full address for each employee.
select concat(Emp_name,' ', city) as full_address from employees_info;


/*------------------------> Math Function <-------------------------*/

-- Find the square root of the "Price" column for all items in the "purchase_inventory" table.
select sqrt(Price) from Purchase_inventory;

-- Calculate the sum of all prices in the "purchase_inventory" table.
select sum(price) as sum_of_all from purchase_inventory;

-- Compute the average (mean) price of items in the "purchase_inventory" table, rounding to the nearest integer.
select round(avg(price)) as Mean_of_price from purchase_inventory;

-- Determine the highest and lowest prices for items in the "purchase_inventory" table.
select max(price) as highest_price from Purchase_inventory; -- highest price

select min(price) as lowest_price from Purchase_inventory; -- lowset price

/*---------------------> Date Function <---------------------*/

-- Retrieve all items in the "purchase_inventory" table that were purchased in the current year.

select * from Purchase_inventory where Year(Purchase_date) = year(Current_date);

/*----------------------> Aggregate Function <----------------------*/

-- Count the number of assets in the "AssetInventory" table for each employee (grouped by emp_id).
select * FROM assetinventory;

select emp_id, count(*) as asset_count from assetinventory group by emp_id;

-- Find the number of items in the "purchase_inventory" table for each category (grouped by category).
select product_category,count(*) as category_count from purchase_inventory group by product_category;

-- Calculate the total number of employees in the "Employees_info" table.
select count(emp_id) as total_emp from employees_info;

-- Determine the number of distinct cities where employees reside.
select distinct(city) from employees_info;

/*-------------------------------------------------> Group by with Having <------------------------------------------*/

-- Retrieve the total number of items and the average price for each category in the "purchase_inventory" table, 
-- but only for categories with an average price above 350000.
select product_category, count(*) as total_items ,avg(price) as average_price
from purchase_inventory group by product_category
having avg(price) > 35000;

-- List all employees in the "Employees_info" table who work in departments with more than 2 employees.
select emp_name,emp_dept from employees_info group by emp_name,emp_dept
having count(*) >= 2;

-- Find all asset categories in the "AssetInventory" table where the number of assets is less than 5.
select category from AssetInventory group by category having count(*) < 5;

/*----------------------------------------------> Joins <-------------------------------------------------------*/

-- Retrieve a list of items and their corresponding categories from the "purchase_inventory" table and the "categories" table, 
-- joining them based on the "category_id" column.

select purchase_inventory.product_name,assetinventory.category from purchase_inventory
inner join assetinventory on purchase_inventory.serial_no  = assetinventory.serial_no;

-- Retrieve a list of all employees from the "Employees_info" table and their respective assets from the "AssetInventory" table.
-- Include employees who do not have any assets.

select employees_info.emp_name,assetinventory.assetname from employees_info
Left join assetinventory on employees_info.emp_id = assetinventory.emp_id;

-- List all assets from the "AssetInventory" table and their corresponding employees from the "Employees_info" table.
-- Include assets that are not assigned to any employee.
select assetinventory.assetname,employees_info.emp_name from assetinventory
Right join employees_info on assetinventory.emp_id = employees_info.emp_id;

-- Retrieve a list of all employees and their assigned assets from the "Employees_info" and "AssetInventory" tables.
-- Include employees without assets and assets without assigned employees.
select employees_info.emp_name,assetinventory.assetname from employees_info
Left join assetinventory on employees_info.emp_id = assetinventory.emp_id
union all 
select assetinventory.assetname,employees_info.emp_name from assetinventory
Right join employees_info on assetinventory.emp_id = employees_info.emp_id;


/*--------------------------------------------------> Subquery <---------------------------------------------------*/

-- Retrieve a list of employees from the "Employees_info" table who work in the same department as the employee with Emp_id 1.

SELECT emp_name
FROM Employees_info
WHERE emp_dept = (SELECT emp_dept FROM Employees_info WHERE Emp_id = 1);

-- Find all items in the "purchase_inventory" table that have a price greater than the average price of all items.
SELECT Product_name, Price
FROM purchase_inventory
WHERE Price > (SELECT AVG(Price) FROM purchase_inventory);

--  List all assets from the "AssetInventory" table that are assigned to employees working in the "Data Analyst" department.
SELECT assetname
FROM AssetInventory
WHERE emp_id IN (SELECT emp_id FROM Employees_info WHERE emp_dept = 'Data Analyst');

/*------------------------------------------------> The END/Thank you <---------------------------------------------------------------*/
