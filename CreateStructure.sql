if object_id('dbo.SKU', 'U') is not null drop table dbo.SKU;
if object_id('dbo.Family', 'U') is not null drop table dbo.Family;
if object_id('dbo.Basket', 'U') is not null drop table dbo.Basket;

create table dbo.SKU
(
ID int identity(1, 1) not null primary key,
Code as ('s' + ID) unique, 
Name varchar(40) not null
);

create table dbo.Family
(
ID int identity(1, 1) not null primary key, 
SurName varchar(40) not null,
BudgetValue numeric(10,2)
);

create table dbo.Basket
(
ID int identity(1, 1) not null, 
ID_SKU int null,
ID_Family int null,
Quantity int not null,
Value int not null,
PurchaseDate datetime not null default(SYSDATETIME()), 
DiscountValue int not null,
 constraint FK_Basket_SKU foreign key(ID_SKU)
    references dbo.SKU(ID),
constraint FK_Basket_Family foreign key(ID_Family)
    references dbo.Family(ID),
constraint CHK_Quantity check (Quantity >= 0),
constraint CHK_Value check (Value >= 0),
);
go