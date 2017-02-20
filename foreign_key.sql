USE [myData]
GO

IF OBJECT_ID('dbo.t1', 'U') IS NOT NULL
	DROP table t1
IF OBJECT_ID('dbo.t2', 'U') IS NOT NULL
	DROP TABLE t2

IF OBJECT_ID('dbo.myTable', 'U') IS NOT NULL
	DROP table dbo.myTable
IF OBJECT_ID('dbo.myTable2', 'U') IS NOT NULL
	DROP TABLE dbo.myTable2
GO

CREATE TABLE t1
(
	id int,
	name varchar(20),
	last_name varchar(10) NOT NULL,
	CONSTRAINT PK_T_ID PRIMARY KEY CLUSTERED(last_name),
	CONSTRAINT FK_T_ID FOREIGN KEY (last_name)
		REFERENCES t2(last_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)


CREATE TABLE t2
(
	id int NOT NULL,
	adress varchar(20),
	last_name varchar(10)
)


INSERT INTO [dbo].[t2]
           ([id],
		    [adress],
            [last_name])
     VALUES
           (0,'6 ave n', 'leon')
GO

INSERT INTO [dbo].[t2]
           ([id],
		    [adress],
            [last_name])
     VALUES
           ( '1 st s', 'jopa')
GO

INSERT INTO [dbo].[t1]
           ([name]
           ,[last_name])
     VALUES
           ('hui', 'jopa')
GO

INSERT INTO dbo.t1 (name, last_name) VALUES ('anna', 'leon');