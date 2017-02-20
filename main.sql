USE [myData]
GO

Drop table myTable

DROP TABLE myTable2
GO

CREATE TABLE myTable
(
	id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	name varchar(20),
	last_name varchar(10)
)

ALTER TABLE myTable
	ADD CONSTRAINT AK_UN UNIQUE (last_name)
;

CREATE TABLE myTable2
(
	id int NOT NULL,
	adress varchar(20),
	last_name varchar(10),
	CONSTRAINT PK_T_ID PRIMARY KEY CLUSTERED(id),
	CONSTRAINT FK_T_ID FOREIGN KEY (last_name)
		REFERENCES myTable(last_name)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

ALTER TABLE myTable2
	ADD CONSTRAINT AK_UN UNIQUE (last_name)
;

INSERT INTO [dbo].[myTable2]
           ([id],
		    [adress],
            [last_name])
     VALUES
           (0,'6 ave n', 'leon')
GO

INSERT INTO [dbo].[myTable2]
           ([id],
		    [adress],
            [last_name])
     VALUES
           ( '1 st s', 'jopa')
GO

INSERT INTO [dbo].[myTable]
           ([name]
           ,[last_name])
     VALUES
           ('hui', 'jopa')
GO

INSERT INTO dbo.myTable (name, last_name) VALUES ('anna', 'leon');