--1. 
--Retrieve only the rows where the PersonType column in the 
--Person.Person table has the value 'IN' (Individual consumers).
--FirstName, MiddleName, LastName from the Person.Person table.
--orderDate, TotalDue from the Sales.SalesOrderHeader table.
select
p.FirstName,p.MiddleName,p.LastName,
odh.OrderDate,odh.TotalDue
from Person.Person p
join sales.Customer c 
	on c.CustomerID=p.BusinessEntityID
join sales.SalesOrderHeader odh
	on odh.CustomerID=c.CustomerID
where p.PersonType='IN'

--2 
--Retrieve the product names and corresponding categories 
--from the Products table and the ProductCategory table.
--Include the following columns in your results:
--Name (use alias ProductName) from the Production.Product table.
--Name (use alias CategoryName) from the Production.ProductCategory table
select
p.Name ProductName,
pc.Name ProductCategory
from Production.Product p
join Production.ProductSubcategory ps 
	on ps.ProductSubcategoryID=p.ProductSubcategoryID
join Production.ProductCategory pc
	on pc.ProductCategoryID=ps.ProductCategoryID

--3
--Retrieve a specific product using its location
--Retrieve the product name for the product stored 
--in Subassembly location, Shelf W and Bin 9
--Include the following columns in your results:
--Name (use alias ProductName) from the Production.Product table.
--Quantity from the Production.ProductInventory table
select
p.Name ProductName,
piv.Quantity
from Production.ProductInventory piv
join Production.Product p 
	on p.ProductID=piv.ProductID
join Production.Location l
	on l.LocationID=piv.LocationID
where l.Name='Subassembly'
	and piv.Shelf='W'
	and piv.Bin=9

