/*
	Microsoft Dynamics AX for Retail POS Upgrade Database Script
	DbVersion: 6.2.9.0
*/

/****** adding new column to [RETAILPOSPERMISSIONGROUP] for Russia ******/
ALTER TABLE [dbo].[RETAILPOSPERMISSIONGROUP]
ADD 
	[ALLOWNOTSAMEDATERETURN_RU] [int] NOT NULL DEFAULT ((0)),
	[ALLOWRETURNOFNONRETURNABLEITEM_RU] [int] NOT NULL DEFAULT ((0))
GO

/****** adding new column to [RETAILPOSITIONPOSPERMISSION] for Russia ******/
ALTER TABLE [dbo].[RETAILPOSITIONPOSPERMISSION]
ADD
	[ALLOWNOTSAMEDATERETURN_RU] [int] NOT NULL DEFAULT ((0)),
	[ALLOWRETURNOFNONRETURNABLEITEM_RU] [int] NOT NULL DEFAULT ((0))
GO

/****** adding new column to [RETAILINVENTTABLE] for Russia ******/
ALTER TABLE [dbo].[RETAILINVENTTABLE]
ADD
	[PROHIBITRETURN_RU] [int] NOT NULL DEFAULT ((0))
GO