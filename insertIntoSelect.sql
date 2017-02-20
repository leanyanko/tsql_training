USE [Store];  
GO  
-- Create tool table.  
CREATE TABLE dbo.taxCalculation(  
   ID INT IDENTITY NOT NULL PRIMARY KEY,   
   [date] date,
   goodID int
);  
GO  
   
-- SET IDENTITY_INSERT to ON.  
SET IDENTITY_INSERT dbo.taxCalculation ON;  
GO   
  
insert into [dbo].[taxCalculation] (id, [date], [goodID])
	select * from [dbo].[Orders] where ( [date] > '12/31/2015')

SELECT *   
FROM dbo.taxCalculation;  
GO  
-- Drop products table.  
--DROP TABLE dbo.taxCalculation;  
--GO  
