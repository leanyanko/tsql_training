USE [myData]
GO

IF OBJECT_ID ( 'myProcedure', 'P' ) IS NOT NULL 
    DROP PROCEDURE myProcedure;
GO
CREATE PROCEDURE myProcedure
AS
    SET NOCOUNT ON;
    SELECT name, last_name
    FROM [dbo].[myTable]


	INSERT INTO [dbo].[myTable]
           ([name]
           ,[last_name])
     VALUES
           ('hui2', 'jopa2')

GO