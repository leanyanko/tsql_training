USE [Store]
GO

IF OBJECT_ID('dbo.Articules', 'U') IS NOT NULL
	DROP table Articules

CREATE TABLE Articules (
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	name nvarchar(50)
)
GO
DECLARE @I int = 0;

WHILE @I < 100
BEGIN
	INSERT INTO [Articules] ([name]) VALUES (NEWID());
	SET @I = @I + 1;
END

select * from [dbo].[Articules] where id < 8


select * from [dbo].[Articules] order by name

SELECT COUNT (DISTINCT [name]) as not_repeated_count 
	FROM [dbo].[Articules]

SELECT name, COUNT(name) quantity
	FROM [dbo].[Articules]
	GROUP BY [name]

SELECT [name]
	FROM [dbo].[Articules]
	GROUP BY name 
	HAVING COUNT([name]) > 1

