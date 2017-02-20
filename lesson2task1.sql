use [Store]
go


--select * from [dbo].[OrdersGoods]

--select [name] from [dbo].[Goods] where [price] > (select avg([price]) from [dbo].[Goods])

--select [name] from [dbo].[Goods] where [price] > (select max([price]) from [dbo].[Goods] group by categoryID having categoryID = 2)

--select [name], (select max(categoryID) from [dbo].Goods) [maxcategoryID] from [dbo].[Goods] 

select * from dbo.Goods as p
	full outer join dbo.OrdersGoods as o
	on p.id = o.goodID
	--where o.orderID is null 
--	 where p.id = 2
