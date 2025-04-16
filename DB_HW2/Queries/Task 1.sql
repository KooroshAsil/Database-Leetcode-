
/*
Koorosh Asil Gharehbaghi 
Computer Science 
40124463
*/

/*
Task 1: 
	Create the tables shown in the Diagram.png
*/

DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Buyers;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100),
    HasColor BOOLEAN DEFAULT FALSE,
    HasSize BOOLEAN DEFAULT FALSE,
    HasWeight BOOLEAN DEFAULT FALSE,
    HasDimensions BOOLEAN DEFAULT FALSE
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2),
    Color VARCHAR(50),
    Weight DECIMAL(10,2),
    Dimensions VARCHAR(255),
    CategoryId INT,
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryID)
);

CREATE TABLE Buyers (
    BuyerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    JoinDate DATE
);

CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    BuyerID INT,
    PurchaseDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (BuyerID) REFERENCES Buyers(BuyerID)
);

INSERT INTO Categories (CategoryName, HasColor, HasSize, HasWeight, HasDimensions) VALUES
('Electronics', 1, 0, 0, 1),
('Clothing', 1, 1, 0, 0),
('Books', 0, 0, 1, 0),
('Furniture', 1, 0, 0, 1),
('Toys', 1, 0, 1, 0);

INSERT INTO Products (ProductID, Name, Price, Color, Weight, Dimensions, CategoryId) VALUES
(1, 'Laptop', 1500.00, 'Black', 1.5, '30.0, 20.0, 2.0', 1),
(2, 'Smartphone', 700.00, 'Silver', 0.2, '15.0, 7.0, 0.8', 1),
(3, 'Book "SQL Guide"', 20.00, 'Blue', 0.5, '24.0, 15.0, 3.0', 3),
(4, 'External Hard Drive', 120.00, 'Grey', 0.4, '15.0, 10.0, 1.5', 1),
(5, 'Headphones', 75.00, 'Red', 0.3, '18.0, 15.0, 5.0', 1),
(6, 'Keyboard', 50.00, 'Black', 0.8, '40.0, 15.0, 2.0', 1),
(7, 'Mouse', 25.00, 'White', 0.1, '10.0, 6.0, 3.0', 1),
(8, 'Monitor', 300.00, 'Black', 3.0, '50.0, 30.0, 4.0', 1),
(9, 'Backpack', 90.00, 'Green', 1.0, '50.0, 40.0, 10.0', 2),
(10, 'Desk Lamp', 45.00, 'Yellow', 0.5, '15.0, 15.0, 30.0', 4);

ALTER TABLE Products AUTO_INCREMENT = 11;

INSERT INTO Buyers (BuyerID, FirstName, LastName, Age, JoinDate) VALUES
(1, 'Sara', 'Alavi', 28, '2022-02-15'),
(2, 'Mehdi', 'Rezai', 34, '2021-07-18'),
(3, 'Zahra', 'Ghasemi', 30, '2022-09-01'),
(4, 'Kian', 'Moghadam', 22, '2023-01-05'),
(5, 'Fatemeh', 'Hosseini', 29, '2021-03-20'),
(6, 'Ali', 'Kazemi', 31, '2021-04-11'),
(7, 'Leyla', 'Shahidi', 25, '2022-11-08'),
(8, 'Mohammad', 'Moradi', 35, '2020-02-17'),
(9, 'Niloofar', 'Abbasi', 27, '2022-05-22'),
(10, 'Rezi', 'Karami', 33, '2021-08-14');

ALTER TABLE Buyers AUTO_INCREMENT = 11;

INSERT INTO Transactions (ProductID, BuyerID, PurchaseDate) VALUES
(1, 1, '2023-01-10'),
(2, 3, '2023-01-11'),
(3, 2, '2023-01-12'),
(4, 4, '2023-01-13'),
(5, 5, '2023-01-14'),
(1, 2, '2023-01-15'),
(2, 4, '2023-01-16'),
(3, 6, '2023-01-17'),
(4, 7, '2023-01-18'),
(5, 8, '2023-01-19'),
(6, 1, '2023-01-20'),
(7, 2, '2023-01-21'),
(8, 3, '2023-01-22'),
(9, 4, '2023-01-23'),
(10, 5, '2023-01-24'),
(1, 6, '2023-01-25'),
(2, 7, '2023-01-26'),
(3, 8, '2023-01-27'),
(4, 9, '2023-01-28'),
(5, 10, '2023-01-29'),
(6, 1, '2023-01-30'),
(7, 2, '2023-01-31'),
(8, 3, '2023-02-01'),
(9, 4, '2023-02-02'),
(10, 5, '2023-02-03'),
(1, 6, '2023-02-04'),
(2, 7, '2023-02-05'),
(3, 8, '2023-02-06'),
(4, 9, '2023-02-07'),
(5, 10, '2023-02-08');