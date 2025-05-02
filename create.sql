show databases;
create database blinkit_database;
use blinkit_database;
create table user ( 
UserID INT PRIMARY KEY, 
Username Varchar(255) NOT NULL , 
Email Varchar(255) NOT NULL , 
PasswordHash Varchar(255) NOT NULL,
Address Varchar(255) NOT NULL,  
 PhoneNumber VARCHAR(20) NOT NULL,
 CreatedAt TIMESTAMP NOT NULL);

create table product (
ProductID INT PRIMARY KEY,
Name Varchar(255) NOT NULL,
Description TEXT ,
Price DECIMAL(10, 2) NOT NULL,
StockLevel INT ,
Category Varchar(255) Not NULL,
ImageURL Varchar(255));

create table orderr (
OrderID INT PRIMARY KEY,
UserID INT NOT NULL,
OrderStatus Varchar(255) NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,
CreatedAt TIMESTAMP NOT NULL,
FOREIGN KEY (UserID) REFERENCES user(UserID));


create table orderitem (
OrderItemID INT PRIMARY KEY,
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL,
Price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES orderr(OrderID),
FOREIGN KEY (ProductID) REFERENCES product(ProductID));


create table deliveryperson (
DeliveryPersonID INT PRIMARY KEY,
Name Varchar(255) NOT NULL,
PhoneNumber Varchar(255) NOT NULL,
CurrentLocation Varchar(255) NOT NULL,
Status Varchar(255) NOT NULL);


create table delivery (
DeliveryID INT PRIMARY KEY,
OrderID INT NOT NULL,
DeliveryPersonID INT NOT NULL,
DeliveryStatus Varchar(255) NOT NULL,
EstimatedDeliveryTime TIMESTAMP NOT NULL,
ActualDeliveryTime TIMESTAMP NOT NULL,
CreatedAt TIMESTAMP NOT NULL,
FOREIGN KEY (OrderID) REFERENCES orderr(OrderID),
FOREIGN KEY (DeliveryPersonID) REFERENCES deliveryperson(DeliverypersonID)
); 

