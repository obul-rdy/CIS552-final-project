CREATE DATABASE CIS552proj;
USE CIS552proj;

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);
SELECT * FROM Suppliers;

-- Create table Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description VARCHAR(255)
);
SELECT * FROM Categories;

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT, -- Foreign key referencing Suppliers table
    CategoryID INT, -- Foreign key referencing Categories table
    QuantityPerUnit VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued VARCHAR (10),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
SELECT * FROM Products;

-- Create table orderDetails
CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
SELECT * FROM OrderDetails;

-- Create Table Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);
SELECT * FROM Customers;

-- Create Table Shippers
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Phone VARCHAR(20)
);
SELECT * FROM Shippers;

-- Create Table Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT, -- Foreign key referencing Customers table
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    ShipAddress VARCHAR(100),
    ShipCity VARCHAR(50),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SELECT * FROM Orders;

-- Create Table Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    OrderID INT, 
    ProductID INT,
    CustomerID INT, 
    ShipperID INT, 
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    DiscountApplied DECIMAL(5, 2),
    TransactionDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
SELECT * FROM Transactions;

-- Insert data into the Suppliers table
INSERT INTO Suppliers (SupplierID, CompanyName, ContactName, Address, City, Region, Country, Phone)
VALUES
(1, 'ABC Corporation', 'John Doe', '123 Main St', 'Anytown', 'North Region', 'Atlantis', '123-456-7890'),
(2, 'XYZ Industries', 'Jane Smith', '456 Elm St', 'Otherville', 'East Region', 'Lemuria', '987-654-3210'),
(3, 'Smithson Ltd.', 'Alice Johnson', '789 Oak St', 'Sometown', 'West Region', 'Eldorado', '111-222-3333'),
(4, 'Johnson & Sons', 'Bob Wilson', '321 Pine St', 'Yourtown', 'South Region', 'Avalon', '444-555-6666'),
(5, 'Maple Enterprises', 'Emily Brown', '654 Maple St', 'Hometown', 'Central Region', 'Shangri-La', '777-888-9999'),
(6, 'Cedar Co.', 'David Lee', '987 Cedar St', 'Theirtown', 'Coastal Region', 'Hyperborea', '222-333-4444'),
(7, 'Birch Industries', 'Sophia Garcia', '210 Birch St', 'Everytown', 'Mountain Region', 'El Dorado', '555-666-7777'),
(8, 'Walnut Corporation', 'Oliver Martinez', '543 Walnut St', 'Thistown', 'Island Region', 'Asgard', '888-999-0000'),
(9, 'Pineapple Ltd.', 'Emma White', '876 Pineapple St', 'Thatplace', 'Desert Region', 'Valhalla', '999-000-1111'),
(10, 'Cherry Enterprises', 'William Taylor', '109 Cherry St', 'Hereville', 'Tundra Region', 'Olympus', '666-777-8888');
SELECT * FROM Suppliers;

INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES
(1, 'Electronics', 'Products related to electronic devices and components'),
(2, 'Clothing', 'Clothing items for various ages and genders'),
(3, 'Home and Garden', 'Items for home decor and gardening'),
(4, 'Books', 'Different genres of books and publications'),
(5, 'Sports and Outdoors', 'Sporting goods and outdoor equipment'),
(6, 'Toys and Games', 'Various toys and games for all ages'),
(7, 'Health and Beauty', 'Healthcare products and beauty supplies'),
(8, 'Food and Beverages', 'Various types of food items and beverages'),
(9, 'Furniture', 'Different types of furniture for home and office'),
(10, 'Automotive', 'Products related to automobiles and accessories');

SELECT * FROM Categories;

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES
(1, 'Smartphone', 1, 1, '1 unit', 599.99, 50, 10, 20, 'No'),
(2, 'T-Shirt', 2, 2, '1 unit', 19.99, 100, 20, 30, 'No'),
(3, 'Gardening Tools Set', 3, 3, '1 set', 49.99, 30, 5, 10, 'No'),
(4, 'Fiction Novel', 4, 4, '1 unit', 12.99, 80, 15, 25, 'No'),
(5, 'Soccer Ball', 5, 5, '1 unit', 29.99, 40, 8, 15, 'No'),
(6, 'Board Game', 6, 6, '1 unit', 39.99, 60, 12, 20, 'No'),
(7, 'Shampoo', 7, 7, '1 bottle', 9.99, 120, 25, 30, 'No'),
(8, 'Coffee Beans', 8, 8, '1 pound', 8.49, 150, 30, 40, 'No'),
(9, 'Desk Chair', 9, 9, '1 chair', 149.99, 25, 7, 10, 'No'),
(10, 'Car Wax', 10, 10, '1 bottle', 14.99, 50, 10, 20, 'No');

SELECT * FROM Products;

INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES
(1, 1, 599.99, 2, 0.05),
(2, 3, 49.99, 1, 0.1),
(3, 6, 39.99, 3, 0.15),
(4, 8, 8.49, 5, 0.2),
(5, 2, 19.99, 4, 0.1),
(6, 4, 12.99, 2, 0.05),
(7, 5, 29.99, 3, 0.15),
(8, 10, 14.99, 1, 0.1),
(9, 9, 149.99, 2, 0.05),
(10, 7, 9.99, 3, 0.1);

SELECT * FROM OrderDetails;

INSERT INTO Customers (CustomerID, CompanyName, ContactName, City, Region, Country, Phone)
VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Berlin', 'west', 'Germany', '030-0074321'),
(2, 'Around the Horn', 'Thomas Hardy', 'London', 'west', 'UK', '(171) 555-7788'),
(3, 'Bs Beverages', 'Victoria Ashworth', 'London', 'east', 'UK', '(171) 555-1212'),
(4, 'Cactus Comidas para llevar', 'Patricio Simpson', 'Buenos Aires', 'north', 'Argentina', '(1) 135-5555'),
(5, 'Eastern Connection', 'Ann Devon', 'London', 'south', 'UK', '(171) 555-0297'),
(6, 'Frankenversand', 'Peter Franken', 'München', 'west', 'Germany', '089-0877310'),
(7, 'GROSELLA-Restaurante', 'Manuel Pereira', 'Caracas', 'DF', 'Venezuela', '(2) 283-2951'),
(8, 'Hanari Carnes', 'Mario Pontes', 'Rio de Janeiro', 'RJ', 'Brazil', '(21) 555-0091'),
(9, 'Island Trading', 'Helen Bennett', 'Cowes', 'Isle of Wight', 'UK', '(198) 555-8888'),
(10, 'La maison d', 'Annette Roulet', 'Toulouse', 'north', 'France', '61.77.61.10');

SELECT * FROM Customers;

INSERT INTO Shippers (ShipperID, CompanyName, Phone)
VALUES
(1, 'Speedy Express', '(123) 456-7890'),
(2, 'United Shipping', '(987) 654-3210'),
(3, 'Quick Cargo Services', '(111) 222-3333'),
(4, 'Swift Logistics', '(444) 555-6666'),
(5, 'FastTrack Couriers', '(777) 888-9999'),
(6, 'Rapid Delivery', '(222) 333-4444'),
(7, 'Reliable Transports', '(555) 666-7777'),
(8, 'Express Shipping Co.', '(888) 999-0000'),
(9, 'A1 Carriers', '(999) 000-1111'),
(10, 'Prime Movers', '(666) 777-8888');

SELECT * FROM Shippers;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate, ShipVia, ShipAddress, ShipCity, ShipPostalCode, ShipCountry)
VALUES
(1, 1, '2023-01-15', '2023-01-20', '2023-01-18', 1, '123 Main St', 'Anytown', '12345', 'United States'),
(2, 3, '2023-02-10', '2023-02-15', '2023-02-12', 2, '456 Elm St', 'Otherville', '67890', 'Canada'),
(3, 5, '2023-03-05', '2023-03-10', '2023-03-08', 1, '789 Oak St', 'Sometown', '23456', 'Australia'),
(4, 2, '2023-04-12', '2023-04-17', '2023-04-15', 3, '321 Pine St', 'Yourtown', '78901', 'Germany'),
(5, 4, '2023-05-20', '2023-05-25', '2023-05-23', 2, '654 Maple St', 'Hometown', '34567', 'France'),
(6, 6, '2023-06-18', '2023-06-23', '2023-06-21', 1, '987 Cedar St', 'Theirtown', '89012', 'Japan'),
(7, 7, '2023-07-02', '2023-07-07', '2023-07-05', 3, '210 Birch St', 'Everytown', '45678', 'United Kingdom'),
(8, 9, '2023-08-14', '2023-08-19', '2023-08-17', 2, '543 Walnut St', 'Thistown', '01234', 'Italy'),
(9, 8, '2023-09-30', '2023-10-05', '2023-10-03', 1, '876 Pineapple St', 'Thatplace', '56789', 'Spain'),
(10, 10, '2023-11-08', '2023-11-13', '2023-11-11', 2, '109 Cherry St', 'Hereville', '34512', 'Brazil');

SELECT*FROM Orders;

INSERT INTO Transactions (TransactionID, OrderID, ProductID, CustomerID, ShipperID, Quantity, TotalPrice, DiscountApplied, TransactionDate)
VALUES
(1, 1, 1, 1, 1, 2, 1199.98, 0.05, '2023-01-18'),
(2, 2, 3, 3, 2, 1, 44.99, 0.1, '2023-02-12'),
(3, 3, 6, 5, 1, 3, 101.97, 0.15, '2023-03-08'),
(4, 4, 8, 2, 3, 5, 33.72, 0.2, '2023-04-15'),
(5, 5, 2, 4, 2, 4, 75.96, 0.1, '2023-05-23'),
(6, 6, 4, 6, 1, 2, 25.98, 0.05, '2023-06-21'),
(7, 7, 5, 7, 3, 3, 77.97, 0.15, '2023-07-05'),
(8, 8, 10, 9, 2, 1, 13.49, 0.1, '2023-08-17'),
(9, 9, 9, 8, 1, 2, 299.98, 0.05, '2023-10-03'),
(10, 10, 7, 10, 2, 3, 29.97, 0.1, '2023-11-11'),
(11, 1, 1, 1, 1, 3, 1799.97, 0.05, '2023-01-18'),
(12, 2, 3, 3, 2, 2, 99.98, 0.1, '2023-02-12'),
(13, 3, 6, 5, 1, 1, 39.99, 0.15, '2023-03-08'),
(14, 4, 8, 2, 3, 3, 25.47, 0.2, '2023-04-15'),
(15, 5, 2, 4, 2, 2, 39.98, 0.1, '2023-05-23'),
(16, 6, 4, 6, 1, 1, 12.99, 0.05, '2023-06-21'),
(17, 7, 5, 7, 3, 2, 59.98, 0.15, '2023-07-05'),
(18, 8, 10, 9, 2, 1, 14.99, 0.1, '2023-08-17'),
(19, 9, 9, 8, 1, 1, 149.99, 0.05, '2023-10-03'),
(20, 10, 7, 10, 2, 2, 19.98, 0.1, '2023-11-11');

SELECT*FROM Transactions;

CREATE VIEW TopSellers AS
SELECT ProductID, SUM(Quantity) AS TotalSold 
FROM Transactions
WHERE YEAR(TransactionDate) = 2023
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 5;

SELECT * FROM TopSellers;

CREATE VIEW HighValueTransactions AS
SELECT *
FROM Transactions
WHERE TotalPrice > 1000;

SELECT * FROM  HighValueTransactions;

CREATE VIEW PendingOrders AS  
SELECT OrderID, OrderDate, ShippedDate
FROM Orders
WHERE ShippedDate IS NULL;
-- Update ShippedDate for a specific OrderID
UPDATE Orders
SET ShippedDate = NULL
WHERE OrderID = 1; 

SELECT * FROM  PendingOrders;

CREATE VIEW LowInventory AS
SELECT ProductID, ProductName, UnitsInStock 
FROM Products
WHERE UnitsInStock < ReorderLevel;
-- Update UnitsInStock in the Products table
UPDATE Products
SET UnitsInStock = 13 
WHERE ProductID = 4; 

SELECT * FROM LowInventory;


CREATE TABLE CategoriesAudit (
  AuditID int AUTO_INCREMENT PRIMARY KEY,
  CategoryID int,
  CategoryName varchar(100),
  Description varchar(255),
  ChangeType varchar(10),
  ChangedOn datetime DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER tr_Categories_Insert 
AFTER INSERT ON Categories
FOR EACH ROW 
BEGIN
  INSERT INTO CategoriesAudit (CategoryID, CategoryName, Description, ChangeType)
  VALUES (NEW.CategoryID, NEW.CategoryName, NEW.Description, 'INSERT');
END;
//
DELIMITER ;


INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES (11, 'Test Category', 'Testing trigger functionality');

SELECT * FROM CategoriesAudit;

DELIMITER //
CREATE TRIGGER tr_Categories_Update
AFTER UPDATE ON Categories
FOR EACH ROW 
BEGIN
  INSERT INTO CategoriesAudit (CategoryID, CategoryName, Description, ChangeType)
  VALUES (NEW.CategoryID, NEW.CategoryName, NEW.Description, 'UPDATE');
END;
//
DELIMITER ;

UPDATE Categories
SET Description = 'New Description'
WHERE CategoryID = 1;

SELECT * FROM CategoriesAudit;

DELIMITER //

CREATE TRIGGER tr_Categories_Delete
AFTER DELETE ON Categories
FOR EACH ROW
BEGIN
  INSERT INTO CategoriesAudit (CategoryID, CategoryName, Description, ChangeType)
  VALUES (OLD.CategoryID, OLD.CategoryName, OLD.Description, 'DELETE');
END;

//
DELIMITER ;
DELETE FROM Categories WHERE CategoryID = 1;

SELECT * FROM CategoriesAudit;


DELIMITER //

CREATE PROCEDURE GetTopCustomers()
BEGIN
  SELECT c.CustomerID, c.CompanyName, SUM(t.TotalPrice) AS TotalRevenue 
  FROM Customers c
  JOIN Transactions t ON c.CustomerID = t.CustomerID  
  GROUP BY c.CustomerID, c.CompanyName
  ORDER BY TotalRevenue DESC
  LIMIT 5;
END;

//
DELIMITER ;
 
CALL GetTopCustomers;

DELIMITER //

CREATE PROCEDURE GetOrderStatus(IN OrderID INT)
BEGIN
  SELECT 
    o.OrderID,
    CASE
      WHEN o.ShippedDate IS NULL THEN 'Pending'
      ELSE 'Shipped'
    END AS OrderStatus
  FROM Orders o
  WHERE o.OrderID = OrderID;
END;

//
DELIMITER ;

CALL GetOrderStatus(1);

-- First, execute the SELECT statement separately
SELECT * FROM Products;

DELIMITER //

CREATE PROCEDURE UpdateProductPrices()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE _ProductID int;
  DECLARE _NewPrice decimal(10,2);
  DECLARE product_cursor CURSOR FOR 
    SELECT ProductID, UnitPrice * 1.1 FROM Products;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN product_cursor;
  
  read_loop: LOOP
    FETCH product_cursor INTO _ProductID, _NewPrice;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    UPDATE Products 
    SET UnitPrice = UnitPrice * 1.10
    WHERE ProductID = _ProductID;
  END LOOP;

  CLOSE product_cursor;
END;

//
DELIMITER ;


CALL UpdateProductPrices();
DROP PROCEDURE CustomerPurchasesSummary;
SELECT * FROM Products;

DELIMITER //

CREATE PROCEDURE CustomerPurchasesReport()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE _CustomerID int;
  DECLARE _CompanyName varchar(100);
  DECLARE _TotalPurchases decimal(10,2);
  DECLARE customer_cursor CURSOR FOR
    SELECT c.CustomerID, c.CompanyName, SUM(t.TotalPrice)
    FROM Customers c
    JOIN Transactions t ON c.CustomerID = t.CustomerID
    GROUP BY c.CustomerID, c.CompanyName;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN customer_cursor;
  
  read_loop: LOOP
    FETCH customer_cursor INTO _CustomerID, _CompanyName, _TotalPurchases;
    IF done THEN
      LEAVE read_loop;
    END IF;
    
    INSERT INTO CustomerPurchaseSummary(CustomerID, CompanyName, TotalPurchases)
    VALUES (_CustomerID, _CompanyName, _TotalPurchases);
    FETCH NEXT FROM customer_cursor INTO _CustomerID, _CompanyName, _TotalPurchases;
  END LOOP;

  CLOSE customer_cursor;
END;

//
DELIMITER ;

CREATE TABLE CustomerPurchaseSummary (
    CustomerID INT,
    CompanyName VARCHAR(100),
    TotalPurchases DECIMAL(10, 2)
);

CALL CustomerPurchasesReport();
select * from CustomerPurchaseSummary;










