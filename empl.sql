use [Employees]
go

declare @month int = 1
declare @year int = 2013
declare @employee int = 5
declare @employeestart int = 5
declare @inflation decimal = 0;
declare @payment int 

While @year < 2017
begin

	while @month < 13
	begin
	--declare @employee int = 5
		while @employee < ((select count ([name]) from [dbo].[Employees]) +  @employeestart)
		begin

			set @payment  =  cast ((select [salary] from [dbo].[Employees] where [id] = @employee) as int) +  @inflation

			insert  into [dbo].[Payments] ([userID], [createdDate], [sum]) values(
				@employee, 
				cast(concat( cast(@month as nvarchar(2)),'/15', '/', cast(@year as nvarchar(4)) ) as date), 
				@payment)

			set @employee = @employee + 1
			--select @employee
		end

		set @employee = 5 
		--select @month as month
		set @month = @month + 1
	end

	set @month = 1
	--select @year as year
	set @inflation = @inflation + 5
	set @year = @year + 1
end



set @month = 1
set @employee = 5

	while @month < (DATEDIFF(month, concat( cast(@month as nvarchar(2)), '/15/2017'), getdate()) +1 )
	begin

		while @employee < (select count ([name]) from [dbo].[Employees])
		begin
			set @payment  =  cast ((select [salary] from [dbo].[Employees] where [id] = @employee) as int) +  @inflation
			insert into [dbo].[Payments] values(
				@employee, 
				cast(concat( cast(@month as nvarchar(2)),'/15/2017' ) as date), 
				@payment)
			set @employee = @employee + 1
		end

		set @employee = 5 
		--select @month as month
		set @month = @month + 1
	end



select * from [dbo].[Payments]

--delete from [dbo].[Payments]

