use TurboAz

CREATE TRIGGER OptionSetModelRelation
ON CarVins
AFTER INSERT
AS
BEGIN
SELECT 'Add New Data'
END

INSERT INTO CarVins (ModelId,OptionId,ManufactureId)
VALUES(5,15,3)

CREATE TRIGGER SelectAllDataAfterDeleteUpdate
ON Models
AFTER DELETE,UPDATE
AS
BEGIN
SELECT * FROM Models
END

DELETE FROM Models WHERE ModelId = 2

CREATE TRIGGER InsertDeletedDataFromGroupsToInsertTable
ON Models
AFTER DELETE
AS
BEGIN
DECLARE @Name nvarchar(50)
SELECT @Name = ModelName FROM deleted ModelsList
INSERT INTO InsertTable VALUES(@Name)
END

DELETE FROM Models WHERE ModelId = 1


CREATE FUNCTION ModelPrice(@Price int) 
RETURNS int
AS
BEGIN
DECLARE @ModelPrice int
SELECT @ModelPrice = COUNT(ModelPrice) FROM Models WHERE @ModelPrice>@Price
RETURN @ModelPrice
END

SELECT dbo.ModelPrice(61500)


CREATE FUNCTION Model(@BrandName nvarchar(50))
RETURNS int
AS
BEGIN
DECLARE @Quantity int
SELECT @Quantity = COUNT(ModelName) FROM Models WHERE ModelName=@BrandName
RETURN @Quantity
END
SELECT dbo.Model('BMW')


CREATE PROCEDURE GetNames
AS
SELECT Name FROM Dealers D inner join Customers C
ON
D.DealerName = C.Name

EXEC GetNames

SELECT Models.ModelName,Models.ModelPrice,Brands.BrandName 
FROM Models 
INNER JOIN Brands
ON Models.ModelId = Brands.BrandId

CREATE VIEW GetModelNameAndBrandName
AS
SELECT Models.ModelName,Models.ModelPrice,Brands.BrandName 
FROM Models 
INNER JOIN Brands
ON Models.ModelId = Brands.BrandId

SELECT * FROM GetModelNameAndBrandName
