use [Store]
go


select * from [dbo].[OrdersGoods]

--select [name] from [dbo].[Goods] where [price] > (select avg([price]) from [dbo].[Goods])

--select [name] from [dbo].[Goods] where [price] > (select max([price]) from [dbo].[Goods] group by categoryID having categoryID = 2)

--select [name], (select max(categoryID) from [dbo].Goods) [maxcategoryID] from [dbo].[Goods] 

select * from dbo.OrdersGoods as e
	inner join dbo.Orders as p
	on e.orderID = p.id 
	 where p.id = 2
	