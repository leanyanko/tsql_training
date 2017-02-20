USE myData
go

create table dbo.NI
(
	ID int NOT NULL,
	T char(8) NULL
);

CREATE table dbo.NCI
(
	ID int NOT NULL,
	T char(8) NULL
);

CREATE CLUSTERED INDEX IX_1
	ON dbo.NCI(ID);

CREATE NONCLUSTERED INDEX IX_2
	ON dbo.NCI(T);

DECLARE @i int = 100000;

DECLARE @t char(1) = 't';

while @i > 0
BEGIN
	insert into dbo.NI values (@i, @t + CAST(@i as char(6)));
	insert into dbo.NCI values (@i, @t + CAST(@i as char(6)));
	SET @i -= 1;
END

SELECT ID, T from dbo.NCI
	ORDER BY ID, T 

select ID, count(*) as C from dbo.NCI
	group by ID, T

SELECT ID, T from dbo.NCI
	where ID > 4000 and ID < 55000 and T LIKE 'T%'

select cast(dbo.NCI.ID as varchar)
	from dbo.NCI
	group by dbo.NCI.ID
	union all
	select dbo.NCI.T
		from dbo.NCI
		group by dbo.NCI.T


select	index_type_desc, 
		index_depth, 
		index_level, 
		page_count
	from sys.dm_db_index_physical_stats
		(
		DB_ID(N'tsql'), 
		OBJECT_ID(N'dbo.NCI'), 
		NULL, 
		NULL, 
		'DETAILED'
		);

SELECT index_type_desc, index_depth, index_level, page_count, record_count
FROM sys.dm_db_index_physical_stats 
    (DB_ID(N'myData'), OBJECT_ID(N'dbo.NCI'), NULL, NULL , 'DETAILED');


if exists (select name from sys.indexes
	where name = N'IX_1')
	drop index IX_1 on dbo.NCI;