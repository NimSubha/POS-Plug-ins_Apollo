/*
    Microsoft Dynamics AX for Retail POS Upgrade Database Script
    DbVersion: 6.2.41.0
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MARKUPTABLE_IN](
    [RECID] [bigint] NOT NULL,
    [EXEMPT] [int] NOT NULL,
    [HSNCODETABLE] [bigint] NOT NULL,
    [ITCCATEGORY] [int] NOT NULL,
    [MARKUPTABLE] [bigint] NOT NULL,
    [SERVICEACCOUNTINGCODETABLE] [bigint] NOT NULL,
    [SERVICECATEGORY] [int] NOT NULL,
    [DATAAREAID] [nvarchar](4) NOT NULL,
 CONSTRAINT [I_MARKUPTABLE_IN_RECID] PRIMARY KEY NONCLUSTERED 
(
    [RECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [I_MARKUPTABLE_IN_ModuleCodeIdx] UNIQUE CLUSTERED 
(
    [MARKUPTABLE] ASC,
    [DATAAREAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'EXEMPT' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [EXEMPT] [int] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_EXEMPT] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'HSNCODETABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [HSNCODETABLE] [bigint] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_HSNCODETABLE] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'ITCCATEGORY' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [ITCCATEGORY] [int] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_ITCCATEGORY] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'MARKUPTABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [MARKUPTABLE] [bigint] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_MARKUPTABLE] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'SERVICEACCOUNTINGCODETABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [SERVICEACCOUNTINGCODETABLE] [bigint] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_SERVICEACCOUNTINGCODETABLE] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'RECID' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [RECID] [bigint] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_RECID] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'SERVICECATEGORY' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]'))
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD [SERVICECATEGORY] [int] NOT NULL CONSTRAINT [DF_MARKUPTABLE_IN_SERVICECATEGORY] DEFAULT ((0))
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'EXEMPT' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_EXEMPT]  DEFAULT ((0)) FOR [EXEMPT]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'HSNCODETABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_HSNCODETABLE]  DEFAULT ((0)) FOR [HSNCODETABLE]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'ITCCATEGORY' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_ITCCATEGORY]  DEFAULT ((0)) FOR [ITCCATEGORY]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'MARKUPTABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_MARKUPTABLE]  DEFAULT ((0)) FOR [MARKUPTABLE]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'SERVICEACCOUNTINGCODETABLE' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_SERVICEACCOUNTINGCODETABLE]  DEFAULT ((0)) FOR [SERVICEACCOUNTINGCODETABLE]
END

IF NOT EXISTS (SELECT * FROM sys.columns WHERE [name] = N'SERVICECATEGORY' AND [object_id] = OBJECT_ID(N'[dbo].[MARKUPTABLE_IN]') AND object_definition(default_object_id) IS NOT NULL)
BEGIN
ALTER TABLE [dbo].[MARKUPTABLE_IN] ADD  CONSTRAINT [DF_MARKUPTABLE_IN_SERVICECATEGORY]  DEFAULT ((0)) FOR [SERVICECATEGORY]
END
GO

--------------------------------------------------------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RETAILTRANSACTIONTAXTRANSGTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE](
    [CHANNEL] [bigint] NOT NULL,
    [ISINCLUDEDINPRICE] [int] NOT NULL,
    [REPLICATIONCOUNTER] [int] IDENTITY(1,1) NOT NULL,
    [SALELINENUM] [numeric](32, 16) NOT NULL,
    [STOREID] [nvarchar](10) NOT NULL,
    [TAXAMOUNT] [numeric](32, 16) NOT NULL,
    [TAXBASIS] [numeric](32, 16) NOT NULL,
    [TAXCOMPONENT] [nvarchar](60) NOT NULL,
    [TAXPERCENTAGE] [numeric](32, 16) NOT NULL,
    [TERMINALID] [nvarchar](10) NOT NULL,
    [TRANSACTIONID] [nvarchar](44) NOT NULL,
    [DATAAREAID] [nvarchar](4) NOT NULL,
    [ROWVERSION] [timestamp] NOT NULL,
 CONSTRAINT [I_1571718136_-36691966] PRIMARY KEY CLUSTERED 
(
    [TERMINALID] ASC,
    [STOREID] ASC,
    [TRANSACTIONID] ASC,
    [SALELINENUM] ASC,
    [TAXCOMPONENT] ASC,
    [CHANNEL] ASC,
    [DATAAREAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
CONSTRAINT [UI_RETAILTRANSACTIONTAXTRANSGTE_REPLICATIONCOUNTER] UNIQUE NONCLUSTERED 
(
    [REPLICATIONCOUNTER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_CHANNEL]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_CHANNEL]  DEFAULT ((0)) FOR [CHANNEL]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_ISINCLUDEDINPRICE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_ISINCLUDEDINPRICE]  DEFAULT ((0)) FOR [ISINCLUDEDINPRICE]
END

GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_SALELINENUM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_SALELINENUM]  DEFAULT ((0)) FOR [SALELINENUM]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_STOREID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_STOREID]  DEFAULT ('') FOR [STOREID]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TAXAMOUNT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TAXAMOUNT]  DEFAULT ((0)) FOR [TAXAMOUNT]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TAXBASIS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TAXBASIS]  DEFAULT ((0)) FOR [TAXBASIS]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TAXCOMPONENT]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TAXCOMPONENT]  DEFAULT ('') FOR [TAXCOMPONENT]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TAXPERCENTAGE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TAXPERCENTAGE]  DEFAULT ((0)) FOR [TAXPERCENTAGE]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TERMINALID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TERMINALID]  DEFAULT ('') FOR [TERMINALID]
END

IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_RETAILTRANSACTIONTAXTRANSGTE_TRANSACTIONID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RETAILTRANSACTIONTAXTRANSGTE] ADD  CONSTRAINT [DF_RETAILTRANSACTIONTAXTRANSGTE_TRANSACTIONID]  DEFAULT ('') FOR [TRANSACTIONID]
END
GO