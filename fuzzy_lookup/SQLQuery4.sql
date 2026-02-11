create database fuzzy_Lookup
go
use fuzzy_Lookup

-- Master customer table (clean reference data)
CREATE TABLE CustomerMaster (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert clean master data
INSERT INTO CustomerMaster VALUES
(1, 'Microsoft Corporation', 'Redmond', 'USA'),
(2, 'Apple Incorporated', 'Cupertino', 'USA'),
(3, 'Google LLC', 'Mountain View', 'USA'),
(4, 'Amazon Web Services', 'Seattle', 'USA'),
(5, 'International Business Machines', 'Armonk', 'USA'),
(6, 'Oracle Corporation', 'Austin', 'USA'),
(7, 'SAP Systems Applications Products', 'Walldorf', 'Germany'),
(8, 'Adobe Systems', 'San Jose', 'USA'),
(9, 'Salesforce Incorporated', 'San Francisco', 'USA'),
(10, 'Intel Corporation', 'Santa Clara', 'USA');

CREATE TABLE CustomerInput (
    InputID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    InputCity VARCHAR(50)
);

-- Insert messy/varied data
INSERT INTO CustomerInput VALUES
(1, 'Microsoft Corp', 'Redmond'),           -- Abbreviated
(2, 'Apple Inc', 'Cupertino'),              -- Abbreviated
(3, 'Gogle', 'Mountain View'),              -- Typo
(4, 'Amazon', 'Seattle'),                   -- Shortened
(5, 'IBM', 'Armonk'),                       -- Acronym
(6, 'Oracle Corp.', 'Austin'),              -- With period
(7, 'SAP', 'Walldorf'),                     -- Acronym
(8, 'Adobe', 'San Jose'),                   -- Shortened
(9, 'Salesforce Inc.', 'San Francisco'),    -- Abbreviated
(10, 'Intl Corporation', 'Santa Clara'),    -- Wrong name
(11, 'MicroSoft', 'Redmond'),               -- Case variation
(12, 'Appel Inc', 'Cupertino');             -- Typo


-- Output table to store matched results
CREATE TABLE CustomerMatched (
    InputID INT,
    InputCompanyName VARCHAR(100),
    MatchedCustomerID INT,
    MatchedCustomerName VARCHAR(100),
    MatchedCity VARCHAR(50),
    MatchedCountry VARCHAR(50),
    SimilarityScore FLOAT,
    ConfidenceScore FLOAT
);