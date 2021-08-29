CREATE DATABASE TurboAz
use TurboAz

CREATE TABLE Customers(
CustomerId int identity PRIMARY KEY,
Name nvarchar(50) not null,
Surname nvarchar(50) not null,
Gender nvarchar(10) CHECK(Gender = 'Male' OR Gender = 'Female'),
BirthDate datetime not null,
Phone nvarchar(50) unique not null,
Email  nvarchar(100) unique
)

CREATE TABLE Brands(
BrandId int identity PRIMARY KEY,
BrandName nvarchar(50) not null
)

CREATE TABLE Models(
ModelId int identity PRIMARY KEY,
ModelName nvarchar(50) not null,
ModelPrice decimal not null,
BrandId int FOREIGN KEY REFERENCES Brands(BrandId)
)

CREATE TABLE Dealers(
DealerId int identity PRIMARY KEY,
DealerName nvarchar(50) not null,
DealerAddress nvarchar(100)
)

CREATE TABLE Dealer_Brand(
DealerId int FOREIGN KEY REFERENCES Dealers(DealerId),
BrandId int FOREIGN KEY REFERENCES Brands(BrandId),
)

CREATE TABLE ManufacturePlant(
ManId int identity PRIMARY KEY,
PlantName nvarchar(50) not null,
PlantType nvarchar(50),
PlantLocation nvarchar(100),
)

CREATE TABLE CarVins(
VinId int identity PRIMARY KEY,
ModelId int not null,
OptionId int not null,
ManufactureDate int,
ManufactureId int not null
)
DROP TABLE CarVins

CREATE TABLE CarParts(
PartId int identity PRIMARY KEY,
PartName nvarchar(50) not null,
ManufactureStartDate datetime not null,
ManufactureEndDate datetime,
ManId int FOREIGN KEY REFERENCES ManufacturePlant(ManId)
)

CREATE TABLE CarOptions(
OptionId int identity PRIMARY KEY,
Color nvarchar(20) not null,
ModelId int FOREIGN KEY REFERENCES Models(ModelId),
EngineId int FOREIGN KEY REFERENCES CarParts(PartId),
TransmissionId int FOREIGN KEY REFERENCES CarParts(PartId),
ChassisId int FOREIGN KEY REFERENCES CarParts(PartId)
)




