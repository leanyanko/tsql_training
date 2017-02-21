use [Employees]
go

--average by departments
select e.[depID], d.[name], avg([salary]) as average
	from [dbo].[Employees] e

	inner join [dbo].[Department] d
	on e.depID = d.id

	group by e.[depID], d.[name]
	order by d.name

--high managers counter

declare @all int =  (select count([name]) from [dbo].[Employees] )
declare @nonmanagers int = 
	(select count(e.[name]) from [dbo].[Employees] e
	inner join  [dbo].[Department] d
	on e.depID = d.id
	where d.[parentDepID] is not null )

declare @managers int = @all - @nonmanagers
	

	select @managers as managers


--last month payments

select count([sum]) from [dbo].[Payments] p 
	where DATEDIFF(month, p.[createdDate], GETDATE())<2


--most expensive employees last 2 years

select e.[id], e.[name], p.summa --, sum(p.[sum]) as 'sum of payments'
	from [dbo].[Employees] e 
	inner join 
		(select top  3 sum([sum]) summa, [userID]  from [dbo].[Payments] 
												   where (DATEDIFF(month, [createdDate], GETDATE())<25) group by  [userID], [sum] order by summa desc ) p 
	on  e.[id] = p.[userID]
--	group by  p.[sum], e.[id], e.[name]
--	order by  sum(p.[sum]) desc

select top 3 e.[id], e.[name], p.summa --, sum(p.[sum]) as 'sum of payments'
	from [dbo].[Employees] e 
	inner join 
(select [userID], sum([sum]) as summa from [dbo].[Payments]  where (DATEDIFF(month, [createdDate], GETDATE())<25) group by [userID] ) p --, [id], [createdDate], [sum]
	on  e.[id] = p.[userID]
	order by p.summa desc


select d.[name], sum(p.[summa]) as full_amount
	from [dbo].[Employees] e 
	inner join 
(select [userID], sum([sum]) as summa from [dbo].[Payments]  where (year([createdDate]) = 2014) group by [userID] ) p 
	on  e.[id] = p.[userID]
	inner join [dbo].[Department] d
	on e.[depID] = d.[id]
	group by  d.[name]


