use [Store]
go

--INSERT
--insert into [dbo].[Goods] 
--	([name], [price], [categoryID]) 
--	values ('Good',90,3);

--DELETE
--delete from [dbo].[Goods] where id = 0

--UPDATE
--declare @i int = (select top 1 [id] from [dbo].[Goods] group by [id] order by [id])
--declare @start int = @i 

--while @i < ((select count([name]) from [dbo].[Goods]) + @start)
--begin
--	update [dbo].[Goods] set [name] = ('Good # ' + cast (@i as nvarchar(2))) where id = @i
--	set @i = @i + 1
--end

--select * from [dbo].[Goods]

update [dbo].[Goods]
	set [price] = [price] * 2
	where [categoryID] in
	 (
		select [id] 
			from [dbo].[Categories] where [name] = 'ups' or [id] > 3
	 )


select * from [dbo].[Goods]