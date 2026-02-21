create database dynamic_package
use dynamic_package

CREATE TABLE dbo.PackageControl (
    PackageID      INT IDENTITY(1,1) PRIMARY KEY,
    PackageName    VARCHAR(200)   NOT NULL,
    PackagePath    VARCHAR(500)   NOT NULL,  -- full file path to .dtsx
    IsActive       BIT            DEFAULT 1,
    ExecutionOrder INT            NOT NULL,
    Description    VARCHAR(500)
);

select * from PackageControl

CREATE TABLE dbo.PackageExecutionLog (
    LogID         INT IDENTITY(1,1) PRIMARY KEY,
    PackageName   VARCHAR(200),
    PackagePath   VARCHAR(500),
    StartTime     DATETIME,
    EndTime       DATETIME,
    Status        VARCHAR(20),    -- 'Running', 'Success', 'Failed'
    ErrorMessage  VARCHAR(MAX),
    RowsProcessed INT             DEFAULT 0
);
select * from PackageExecutionLog
CREATE TABLE dbo.Customers (
    CustomerID   INT,
    CustomerName VARCHAR(100),
    City         VARCHAR(100),
    LoadDate     DATETIME DEFAULT GETDATE()
);
truncate table Customers
select * from Customers

DROP TABLE dbo.Products;

CREATE TABLE dbo.Products (
    ProductID   VARCHAR(10),    
    Category    VARCHAR(100),
    Price       DECIMAL(10,2),
    LoadDate    DATETIME DEFAULT GETDATE()
);
truncate table orders
select * from Orders
CREATE TABLE dbo.Products (
    ProductID   INT,
    ProductName VARCHAR(100),
    Category    VARCHAR(100),
    Price       DECIMAL(10,2),
    LoadDate    DATETIME DEFAULT GETDATE()
);
truncate table Products
select * from Products

-- Update paths to match where YOU saved your .dtsx files
INSERT INTO dbo.PackageControl (PackageName, PackagePath, IsActive, ExecutionOrder, Description)
VALUES
('Load_Customers', 'C:\SSIS_Practice\Packages\Load_Customers.dtsx', 1, 1, 'Loads customer master data'),
('Load_Orders',    'C:\SSIS_Practice\Packages\Load_Orders.dtsx',    1, 2, 'Loads daily order transactions'),
('Load_Products',  'C:\SSIS_Practice\Packages\Load_Products.dtsx',  1, 3, 'Loads product catalog');

UPDATE dbo.PackageControl
SET PackagePath = 'D:\myssil\Dynamic ETL Orchestration Framework\Dynamic ETL Orchestration Framework\Load_Customers.dtsx'
WHERE PackageName = 'Load_Customers';

UPDATE dbo.PackageControl
SET PackagePath = 'D:\myssil\Dynamic ETL Orchestration Framework\Dynamic ETL Orchestration Framework\Load_Orders.dtsx'
WHERE PackageName = 'Load_Orders';

UPDATE dbo.PackageControl
SET PackagePath = 'D:\myssil\Dynamic ETL Orchestration Framework\Dynamic ETL Orchestration Framework\Load_Products.dtsx'
WHERE PackageName = 'Load_Products';