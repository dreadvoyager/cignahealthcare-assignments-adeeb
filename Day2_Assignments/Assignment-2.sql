-- Create Tables--
CREATE TABLE Products(
  PID NUMBER PRIMARY KEY,
  PName VARCHAR2(100) NOT NULL,
  Category VARCHAR2(50) NOT NULL,
  Price NUMBER CHECK (Price >= 0),
  Quantity NUMBER DEFAULT 0
  );
  
CREATE TABLE Customers(
  CID NUMBER PRIMARY KEY,
  FName VARCHAR2(50) NOT NULL,
  LName VARCHAR2(50) NOT NULL,
  Email VARCHAR2(100) UNIQUE,
  Phone VARCHAR2(13)
  );
  
CREATE TABLE Orders(
  OID NUMBER PRIMARY KEY,
  Cust_ID NUMBER,
  ODate DATE DEFAULT SYSDATE,
  Total NUMBER CHECK (Total >=0 )
  CONSTRAINT fk_cid FOREIGN KEY (Cust_ID) REFERENCES Customers(CID) ON DELETE CASCADE
  );
  
CREATE TABLE OrderDetails(
  ODID NUMBER PRIMARY KEY,
  Order_ID NUMBER,
  Product_ID NUMBER,
  Quantity NUMBER CHECK (Quantity >=0 ),
  CONSTRAINT fk_oid FOREIGN KEY (Order_ID) REFERENCES Orders(OID) ON DELETE CASCADE,
  CONSTRAINT fk_pid FOREIGN KEY (Product_ID) REFERENCES Products(PID) ON DELETE CASCADE
  );
  
--Insert Data--
INSERT INTO Products (PID, PName, Category, Price, Quantity) VALUES (1, 'Laptop', 'Electronics', 70000, 5);
INSERT INTO Products (PID, PName, Category, Price, Quantity) VALUES (2, 'Headphone', 'Electronics', 20000, 50);

INSERT INTO Customers (CID, FName, LName, Email, Phone) VALUES (101, 'Ankit', 'Kumar', 'ankit@gmail.com', '+91 6864325790');
INSERT INTO Customers (CID, FName, LName, Email, Phone) VALUES (102, 'Sal', 'Khan', 'sal@gmail.com', '+91 9664325591');

INSERT INTO Orders (OID, Cust_ID, ODate, Total) VALUES (011, 101, '2025-09-05', 50000);
INSERT INTO Orders (OID, Cust_ID, ODate, Total) VALUES (012, 102, '2025-10-11', 20000);

INSERT INTO OrderDetails (ODID, Order_ID, Product_ID, Quantity) VALUES (50, 011, 1, 5);
INSERT INTO OrderDetails (ODID, Order_ID, Product_ID, Quantity) VALUES (51, 012, 2, 10);

--Retrieve Data--
SELECT * FROM Products WHERE Quantity<20 ;
SELECT Cust_ID, Total FROM Orders ;
UPDATE Products p JOIN OrderDetails od ON p.PID = od.Product_ID SET p.Quantity=p.Quantity-od.Quantity;








 
