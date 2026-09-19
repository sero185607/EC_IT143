/*
    EC_IT143_W3.4_sr.sql
    Sebastian Rojas
    Week 3.4 - AdventureWorks Create Answers

    I am still learning SQL, so I kept the queries simple and readable.
*/

USE AdventureWorks2022;
GO

/* =====================================================
   Q1 - Marginal
   Stanley Anero

   Question: What are the names and product numbers of all
   active products we currently sell?
   ===================================================== */

SELECT Name, ProductNumber
FROM Production.Product
WHERE SellEndDate IS NULL;
GO


/* =====================================================
   Q2 - Marginal
   Stanley Anero

   Question: Which ten unique currencies do we support for
   international customer sales transactions?
   ===================================================== */

SELECT TOP 10 CurrencyCode, Name
FROM Sales.Currency
ORDER BY Name;
GO


/* =====================================================
   Q3 - Moderate
   Stanley Anero

   Question: Can you show me all products that have received
   written reviews, including the product name and review text?
   ===================================================== */

SELECT Product.Name, ProductReview.Comments
FROM Production.Product
JOIN Production.ProductReview
    ON Product.ProductID = ProductReview.ProductID
WHERE ProductReview.Comments IS NOT NULL;
GO


/* =====================================================
   Q4 - Moderate
   Stanley Anero

   Question: Can you find all sales reps who are in the
   Northwest region and show their names and territory?
   ===================================================== */

SELECT Person.FirstName,
       Person.LastName,
       SalesTerritory.Name AS Territory
FROM Sales.SalesPerson
JOIN Person.Person
    ON Sales.SalesPerson.BusinessEntityID = Person.BusinessEntityID
JOIN Sales.SalesTerritory
    ON Sales.SalesPerson.TerritoryID = SalesTerritory.TerritoryID
WHERE SalesTerritory.Name = 'Northwest';
GO


/* =====================================================
   Q5 - Increased
   Stanley Anero

   Question: Which storage locations have our most expensive
   bicycle parts? Show the location, product, quantity, and cost.
   ===================================================== */

SELECT Location.Name AS StorageLocation,
       Product.Name AS ProductName,
       SUM(ProductInventory.Quantity) AS QuantityOnHand,
       Product.StandardCost
FROM Production.ProductInventory
JOIN Production.Product
    ON ProductInventory.ProductID = Product.ProductID
JOIN Production.ProductSubcategory
    ON Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
JOIN Production.ProductCategory
    ON ProductSubcategory.ProductCategoryID = ProductCategory.ProductCategoryID
JOIN Production.Location
    ON ProductInventory.LocationID = Location.LocationID
WHERE ProductCategory.Name = 'Components'
GROUP BY Location.Name,
         Product.Name,
         Product.StandardCost
ORDER BY Product.StandardCost DESC;
GO


/* =====================================================
   Q6 - Increased
   Stanley Anero

   Question: For online orders in 2012, can we see the shipping
   destination, total tax, and total freight cost?
   ===================================================== */

SELECT Address.City,
       StateProvince.Name AS StateName,
       CountryRegion.Name AS CountryName,
       SUM(SalesOrderHeader.TaxAmt) AS TotalTax,
       SUM(SalesOrderHeader.Freight) AS TotalFreight
FROM Sales.SalesOrderHeader
JOIN Person.Address
    ON SalesOrderHeader.ShipToAddressID = Address.AddressID
JOIN Person.StateProvince
    ON Address.StateProvinceID = StateProvince.StateProvinceID
JOIN Person.CountryRegion
    ON StateProvince.CountryRegionCode = CountryRegion.CountryRegionCode
WHERE SalesOrderHeader.OnlineOrderFlag = 1
  AND SalesOrderHeader.OrderDate >= '20120101'
  AND SalesOrderHeader.OrderDate < '20130101'
GROUP BY Address.City,
         StateProvince.Name,
         CountryRegion.Name
ORDER BY TotalTax DESC;
GO


/* =====================================================
   Q7 - Metadata
   Sebastian Rojas

   Question: Can you list all the tables in the Sales schema
   and show their table type?
   ===================================================== */

SELECT TABLE_NAME, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales';
GO


/* =====================================================
   Q8 - Metadata
   Sebastian Rojas

   Question: Can you list the columns in Production.Product
   that use numeric data types?
   ===================================================== */

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
  AND TABLE_NAME = 'Product'
  AND DATA_TYPE IN ('int', 'smallint', 'tinyint', 'decimal', 'numeric', 'money', 'smallmoney', 'float', 'real');
GO
