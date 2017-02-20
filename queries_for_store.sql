insert into [dbo].[Goods] ([name], [price], [categoryID]) values ('dtyhd',56,2);
update [dbo].[Goods] set [price] = 21 where name = 'stg';
select [name], [price] from Goods where [categoryID] = 2;