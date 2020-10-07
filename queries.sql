-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT ProductName, CategoryID
FROM Product;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT Id, ShipName 
From [Order]
WHERE OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT product.ProductName, orderdetail.Quantity
FROM OrderDetail
JOIN Product on product.id = orderdetail.productId
WHERE orderdetail.OrderId = 10251
ORDER BY product.ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT O.Id, Customer.CompanyName, Employee.LastName 
FROM Customer
JOIN [Order] AS O on O.CustomerId = customer.Id 
JOIN employee on employee.Id = O.employeeId;

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT COUNT(Products.CategoryID), Categories.CategoryName
FROM Products
LEFT JOIN Categories 
ON Products.CategoryID = Categories.CategoryID
Group By CategoryName;

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT OrderID, COUNT(p.ProductID) AS 'ItemCount' 
FROM OrderDetails AS o
JOIN Products AS p
ON p.ProductID = o.ProductID
GROUP BY OrderID 

