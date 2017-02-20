use [Store]
go

select top 3  [name], [price] from dbo.Goods 
	group by [name], [price]
	having [name] like 'a%'

declare @date date = getdate()
select @date

declare @somedate varchar(10) 
set @somedate = convert (varchar(10), @date, 104)
select @somedate as '104'

select convert (varchar(20), getdate(), 105) as '105'

select convert (varchar(20), getdate(), 103) as '103'

select convert (varchar(20), getdate(), 102) as '102'

select convert (varchar(20), getdate(), 101) as '101'

select convert (varchar(20), getdate(), 100) as '100'

select convert (varchar(20), getdate(), 106) as '106'