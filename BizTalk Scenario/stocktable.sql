DROP TABLE Stock
DROP TABLE Products
DROP TABLE Warehouses

CREATE TABLE Warehouses (
	WarehouseId INT NOT NULL IDENTITY(1,1),
	WarehouseName VARCHAR(32) NOT NULL,
	CONSTRAINT PK_Warehouses PRIMARY KEY (WarehouseId)
)

CREATE TABLE Products (
	ProductId INT NOT NULL IDENTITY(1,1),
	ProductCode CHAR(3) NOT NULL,
	ProductDescription VARCHAR(32) NOT NULL,
	CONSTRAINT PK_Products PRIMARY KEY (ProductId),
	CONSTRAINT AK_Products__Code UNIQUE (ProductCode)
)

CREATE TABLE Stock (
	WarehouseId INT NOT NULL
	CONSTRAINT FK_Stock__WarehouseId FOREIGN KEY REFERENCES Warehouses(WarehouseId),
	ProductId INT NOT NULL
	CONSTRAINT FK_Stock__ProductId FOREIGN KEY REFERENCES Products(ProductId),
	Level INT NOT NULL,
	CONSTRAINT PK_Stock PRIMARY KEY (WarehouseId, ProductId)
)
GO

SET IDENTITY_INSERT Warehouses ON


INSERT INTO Warehouses (WarehouseId, WarehouseName) VALUES 
	(1, 'Malawi'),
	(2, 'Tanzania')

SET IDENTITY_INSERT Warehouses OFF
SET IDENTITY_INSERT Products ON

INSERT INTO Products (ProductId, ProductCode, ProductDescription) VALUES
	(1, 'ABC', 'Widgets')

INSERT INTO Stock (WarehouseId, ProductId, Level) VALUES
	(1, 1, 10),
	(2, 1, 0)

SET IDENTITY_INSERT Products OFF
GO

SELECT * FROM Warehouses
SELECT * FROM Products
SELECT * FROM Stock