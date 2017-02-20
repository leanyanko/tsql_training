USE [Store]
GO

--declare @comma nvarchar(75) = 'the,quick,brown,fox,jumped,over,the,lazy,dog,'
--declare @begin int = 0, @count int = 0, @max int
--select @max = len(@comma) - len(replace(@comma, ',',''))

--while @count < @max
--begin
--	select SUBSTRING(@comma,@begin, CHARINDEX(',',@comma, @begin + 1) - @begin) as substring
--	select CHARINDEX(',',@comma, @begin + 1) + 1 as [begin]
--	set @begin = CHARINDEX(',',@comma, @begin + 1) + 1

--	set @count = @count + 1
--end

declare @cursor as cursor
set @cursor = cursor for 
	select top 3 [name], [price] from [dbo].[Goods];

declare @name nvarchar(50), @price money
open @cursor
fetch next from @cursor into @name, @price;

while @@FETCH_STATUS = 0 
begin
	print @name + ' ' + cast(@price as nvarchar(20))
	fetch next from @cursor into @name, @price;
end

close @cursor
deallocate @cursor