USE [myData]
GO

IF OBJECT_ID('dbo.t1', 'U') IS NOT NULL
	DROP table t1
IF OBJECT_ID('dbo.t2', 'U') IS NOT NULL
	DROP TABLE t2

IF OBJECT_ID('dbo.myTable') IS NOT NULL
	DROP table dbo.myTable
IF OBJECT_ID('dbo.myTable2') IS NOT NULL
	DROP TABLE dbo.myTable2

IF OBJECT_ID('dbo.keys', 'U') IS NOT NULL
	DROP table keys
IF OBJECT_ID('dbo.fk', 'U') IS NOT NULL
	DROP TABLE fk
GO

IF OBJECT_ID('dbo.ad_userSubs', 'U') IS NOT NULL
	DROP TABLE ad_userSubs
GO

IF OBJECT_ID('dbo.ad_userFilters', 'U') IS NOT NULL
	DROP TABLE ad_userFilters
GO