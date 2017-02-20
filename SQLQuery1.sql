CREATE TABLE [dbo].[ad_userSubs] (
	[id][int] IDENTITY(1,1) NOT NULL,
	[userGuid][uniqueidentifier] NULL,
	[created][datetime] NOT NULL,
	[posted][datetime] NULL,
	[filterID][int]NOT NULL
	CONSTRAINT [PK_ad_userSubs] PRIMARY KEY CLUSTERED(
		[id] ASC
	) WITH (
		PAD_INDEX = OFF,
		STATISTICS_NORECOMPUTE = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON
	) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ad_userFilters] (
	[id][int] IDENTITY(1,1) NOT NULL,
	[userGuid][uniqueidentifier] NULL,
	[FK_ad_usersSubs_ad_userFilters][int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ad_userSubs]
	WITH CHECK ADD CONSTRAINT [FK_ad_usersSubs_ad_userFilters] FOREIGN KEY([filterID])
	REFERENCES [dbo].[ad_userFilters](id) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ad_userSubs] 
	CHECK CONSTRAINT [FK_ad_usersSubs_ad_userFilters]
GO