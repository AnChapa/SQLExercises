/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
	FROM products
	INNER JOIN categories ON products.CategoryID = categories.CategoryID
    WHERE categories.Name = 'computers';
    
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
	FROM products
    RIGHT JOIN reviews ON products.ProductID = reviews.ProductID
    WHERE reviews.Rating = 5;
    
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(employees.FirstName, ' ', employees.LastName) AS Employee, SUM(sales.Quantity) AS Total_Sales
	FROM employees
    LEFT JOIN sales ON employees.EmployeeID = sales.EmployeeID
    GROUP BY Employee
    ORDER BY Total_Sales DESC;
    
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT categories.Name AS Category, departments.Name AS Department
	FROM categories
	INNER JOIN departments ON categories.DepartmentID = departments.DepartmentID
    WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';
    
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name AS  Eagles_Album, SUM(sales.quantity) AS Total_Sold, SUM(sales.Quantity * sales.PricePerUnit) AS Total_Price_Sold
	FROM products
    INNER JOIN sales ON products.ProductID = sales.ProductID
    WHERE products.Name = 'Eagles: Hotel California'
    GROUP BY Eagles_Album;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name AS Product, reviews.Reviewer AS Reviewer_Name, reviews.Rating AS Rating, reviews.Comment AS Comment
	From products
    INNER JOIN reviews ON products.ProductID = reviews.ProductID
    WHERE products.Name = 'Visio TV' AND reviews.Rating = (SELECT MIN(reviews.Rating)
																FROM reviews);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID AS ID, CONCAT(employees.FirstName, ' ', employees.LastName) AS Employee, products.Name AS Product_Name, SUM(sales.Quantity) AS Amount_Sold
	FROM employees
    INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
    INNER JOIN products ON sales.ProductID = products.ProductID
    GROUP BY employees.EmployeeID, products.ProductID
	ORDER BY ID DESC, Product_Name;
