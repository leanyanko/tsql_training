use [Store]
go

select top 3  [name], [price] from dbo.Goods 
	group by [name], [price]
	having [name] like 'a%'
