use [Store]
go

select top 3  [name], [price] from dbo.Goods 
	group by [name], [price]
	having [name] like 'a%'

select [id], [name] =  
		case [id]
			when 1 then 'Homeware'
			when 2 then 'Clothes'
			when 3 then 'Food'
			when 4 then 'Other'
			when 5 then 'Sport'
		end	
from [dbo].[categories]
select * from [dbo].[Categories]

update [dbo].[categories]
	set [name] =
		case [id]
			when 1 then 'Homeware'
			when 2 then 'Clothes'
			when 3 then 'Food'
			when 4 then 'Other'
			when 5 then 'Sport'
		end	

select * from [dbo].[Categories]

declare @string int;

set @string = convert(int, '137');

declare @check int = @string + 11

select @check