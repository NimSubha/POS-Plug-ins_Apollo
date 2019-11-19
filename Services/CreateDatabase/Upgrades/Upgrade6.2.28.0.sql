/*
    Microsoft Dynamics AX for Retail POS Upgrade Database Script
    DbVersion: 6.2.28.0
*/

/****** Index created to enhance the search performance ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = object_id(N'[dbo].[RETAILOFFLINESYNCLOG]') AND NAME = N'IX_RETAILOFFLINESYNCLOG_SCOPEID')
BEGIN
CREATE NONCLUSTERED INDEX [IX_RETAILOFFLINESYNCLOG_SCOPEID] ON [dbo].[RETAILOFFLINESYNCLOG]
(
	[SCOPEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = object_id(N'[dbo].[RETAILOFFLINESYNCLOG]') AND NAME = N'IX_RETAILOFFLINESYNCLOG_TERMINALID')
BEGIN
CREATE NONCLUSTERED INDEX [IX_RETAILOFFLINESYNCLOG_TERMINALID] ON [dbo].[RETAILOFFLINESYNCLOG]
(
	[TERMINAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = object_id(N'[dbo].[RETAILOFFLINESYNCLOG]') AND NAME = N'IX_RETAILOFFLINESYNCLOG_SYNCSTOPTIME')
BEGIN
CREATE NONCLUSTERED INDEX [IX_RETAILOFFLINESYNCLOG_SYNCSTOPTIME] ON [dbo].[RETAILOFFLINESYNCLOG]
(
	[SYNCSTOPTIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

