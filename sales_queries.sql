USE salesanalytics;
SELECT * FROM customer;
SELECT * FROM products;
SELECT * FROM salesanalytics.order;
SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM salesanalytics.order;
SELECT * FROM salesanalytics.order LIMIT 10;
SELECT SUM(Sales) AS Total_Sales FROM salesanalytics.order;
SELECT MAX(Sales) AS Highest_Sale FROM salesanalytics.order;
SELECT AVG(Sales) AS Average_Sales FROM salesanalytics.order;
SELECT MIN(Sales) AS Lowest_Sale FROM salesanalytics.order;
SELECT * FROM customer WHERE city = 'chennai';
SELECT * FROM customer WHERE gender = 'female';
SELECT * FROM customer WHERE age>30;
SELECT * FROM products WHERE unit_Price > 20000;
SELECT * FROM salesanalytics.order WHERE Quantity > 3;
SELECT * FROM salesanalytics.order WHERE sales>50000;
SELECT * FROM products order by unit_price DESC;
SELECT * FROM customer order by age ASC;
SELECT * FROM customer order by age DESC;
SELECT * FROM products order by unit_price ASC;
SELECT * FROM products order by unit_price DESC;
SELECT * FROM salesanalytics.order order by sales DESC LIMIT 10;
SELECT * FROM salesanalytics.order order by profit DESC LIMIT 5;
SELECT product_ID, SUM(sales) as total_sales from salesanalytics.order group by product_ID;
SELECT customer_ID, SUM(sales) as total_sales from salesanalytics.order group by customer_ID;
SELECT product_ID, SUM(Quantity) as total_quantity from salesanalytics.order group by product_ID;
SELECT product_ID, AVG(Profit) as average_profit FROM salesanalytics.order group by product_ID;
SELECT customer_ID, count(*) as total_orders FROM salesanalytics.order group by customer_ID;
SELECT customer_ID, max(Sales) as highest_sale FROM salesanalytics.order group by customer_ID;
SELECT c.customer_name, o.order_ID, o.sales from customer c join salesanalytics.order o on c.customer_ID = o.Customer_ID;
SELECT p.product_name, o.sales, o.quantity from products p join salesanalytics.order o on p.product_ID = o.product_ID;
SELECT c.customer_name,p.product_name, o.sales, o.Profit from salesanalytics.order o join customer c on o.customer_ID = c.customer_ID join products p on p.Product_ID = o.Product_ID;
SELECT c.customer_name, SUM(o.sales) as total_sales from customer c join salesanalytics.order o on c.customer_ID = o.customer_ID group by c.customer_name;
SELECT p.product_name, SUM(o.sales) as total_sales from products p join salesanalytics.order o on p.product_ID = o.Product_ID group by p.product_name;
SELECT customer_ID, SUM(sales) as total_sales from salesanalytics.order group by customer_ID having sum(sales) > 100000;
SELECT product_ID, SUM(Quantity) as total_Quantity from salesanalytics.order group by product_ID having sum(Quantity) > 20;
SELECT customer_ID, count(*) as total_orders from salesanalytics.order group by customer_ID having count(*) > 10;
SELECT order_ID, sales, case when sales >= 50000 then 'high sales' else 'low sales' end as sales_category from salesanalytics.order ;
SELECT * FROM salesanalytics.order where sales > ( SELECT AVG (sales) FROM salesanalytics.order );
CREATE VIEW customersales as SELECT c.customer_name, SUM(o.sales) as total_sales FROM customer c join salesanalytics.order o on c.customer_ID = o.Customer_ID group by c.customer_name;
SELECT * FROM customersales;
SELECT order_ID, sales, row_number() over (order by sales desc) as row_num from salesanalytics.order;
SELECT MONTH(order_date) as month, sum(sales) as total_sales from salesanalytics.order group by month(order_date) order by month;
SELECT customer_ID, SUM(sales) as total_sales from salesanalytics.order group by Customer_ID order by total_sales DESC LIMIT 5;
update salesanalytics.customer set region = 'North' where Customer_ID between 'C001' and 'C025';
update salesanalytics.customer set region = 'East' where Customer_ID between 'C026' and 'C050';
update salesanalytics.customer set region = 'West' where Customer_ID between 'C051' and 'C075';
update salesanalytics.customer set region = 'South' where Customer_ID between 'C076' and 'C100';
select region, count(*) as total_customers from customer group by region;
select * from customersales;





 












