CREATE DATABASE SALES;
GO

USE SALES;
GO

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50)
);
GO

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    Discount DECIMAL(5,2) DEFAULT 0,
    CHECK (UnitPrice > 0),
    CHECK (StockQuantity >= 0),
    CHECK (Discount >= 0 AND Discount <= 100)
);
GO

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderAmount DECIMAL(10,2) NOT NULL,
    Status VARCHAR(30) NOT NULL,
    PaymentMethod VARCHAR(30) NOT NULL,
    ShippingStatus VARCHAR(30) NOT NULL,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    CHECK (OrderAmount > 0)
);
GO

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    CHECK (Quantity > 0)
);
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,

    CHECK (Salary > 0)
);
GO

INSERT INTO Customers
(CustomerID, CustomerName, Email, Phone, City, State)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210', 'Chennai', 'Tamil Nadu'),
(2, 'Priya Sharma', 'priya@gmail.com', '9876543211', 'Bangalore', 'Karnataka'),
(3, 'Rahul Raj', 'rahul@yahoo.com', '9876543212', 'Chennai', 'Tamil Nadu'),
(4, 'Anitha Devi', 'anitha@gmail.com', '9876543213', 'Coimbatore', 'Tamil Nadu'),
(5, 'Karthik S', 'karthik@gmail.com', '9876543214', 'Madurai', 'Tamil Nadu'),
(6, 'Pooja Kumar', 'pooja@yahoo.com', '9876543215', 'Bangalore', 'Karnataka'),
(7, 'Vijay Kumar', 'vijay@gmail.com', '9876543216', 'Salem', 'Tamil Nadu'),
(8, 'Aishwarya R', 'aishwarya@gmail.com', '9876543217', 'Chennai', 'Tamil Nadu'),
(9, 'Manoj Kumar', 'manoj@yahoo.com', '9876543218', 'Hyderabad', 'Telangana'),
(10, 'Deepa M', 'deepa@gmail.com', '9876543219', 'Coimbatore', 'Tamil Nadu');
GO

INSERT INTO Products
(ProductID, ProductName, Category, UnitPrice, StockQuantity, Discount)
VALUES
(101, 'Laptop', 'Electronics', 55000, 8, 10),
(102, 'Mobile Phone', 'Electronics', 25000, 25, 5),
(103, 'Headphones', 'Electronics', 2500, 50, 15),
(104, 'Keyboard', 'Electronics', 1500, 40, 10),
(105, 'Office Chair', 'Furniture', 8500, 12, 8),
(106, 'Study Table', 'Furniture', 12000, 7, 12),
(107, 'Mouse', 'Electronics', 800, 60, 5),
(108, 'Printer', 'Electronics', 15000, 5, 10),
(109, 'Bookshelf', 'Furniture', 7000, 15, 5),
(110, 'Desk Lamp', 'Furniture', 1800, 30, 20);
GO

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, OrderAmount, Status, PaymentMethod, ShippingStatus)
VALUES
(1001, 1, '2026-01-05', 55000, 'Completed', 'UPI', 'Delivered'),
(1002, 2, '2026-01-10', 25000, 'Completed', 'Card', 'Delivered'),
(1003, 3, '2026-01-15', 8500, 'Completed', 'Cash', 'Delivered'),
(1004, 4, '2026-02-03', 15000, 'Pending', 'UPI', 'Pending'),
(1005, 5, '2026-02-10', 12000, 'Completed', 'Card', 'Shipped'),
(1006, 6, '2026-02-18', 2500, 'Cancelled', 'UPI', 'Cancelled'),
(1007, 7, '2026-03-01', 30000, 'Completed', 'UPI', 'Delivered'),
(1008, 8, '2026-03-12', 7000, 'Completed', 'Cash', 'Delivered'),
(1009, 9, '2026-03-20', 15000, 'Pending', 'Card', 'Pending'),
(1010, 10, '2026-04-05', 18000, 'Completed', 'UPI', 'Shipped'),
(1011, 1, '2026-04-15', 2500, 'Completed', 'Card', 'Delivered'),
(1012, 2, '2026-05-02', 55000, 'Completed', 'UPI', 'Delivered'),
(1013, 3, '2026-05-15', 1800, 'Cancelled', 'Cash', 'Cancelled'),
(1014, 5, '2026-06-01', 25000, 'Completed', 'Card', 'Delivered'),
(1015, 7, '2026-06-10', 8500, 'Pending', 'UPI', 'Pending');
GO

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1003, 105, 1),
(4, 1004, 108, 1),
(5, 1005, 106, 1),
(6, 1006, 103, 1),
(7, 1007, 102, 1),
(8, 1007, 107, 5),
(9, 1008, 109, 1),
(10, 1009, 108, 1),
(11, 1010, 110, 10),
(12, 1011, 103, 1),
(13, 1012, 101, 1),
(14, 1013, 110, 1),
(15, 1014, 102, 1),
(16, 1015, 105, 1);
GO

INSERT INTO Employees
(EmployeeID, EmployeeName, Email, Department, Salary)
VALUES
(1, 'Suresh Kumar', 'suresh@company.com', 'Sales', 35000),
(2, 'Meena Ravi', 'meena@company.com', 'HR', 42000),
(3, 'Gokul Raj', 'gokul@company.com', 'Sales', 38000),
(4, 'Divya S', 'divya@company.com', 'Finance', 45000),
(5, 'Naveen Kumar', 'naveen@company.com', 'IT', 55000);
GO
SELECT * FROM Customers;
GO

SELECT * FROM Products;
GO

SELECT * FROM Orders;
GO

SELECT * FROM OrderDetails;
GO

SELECT * FROM Employees;
GO
