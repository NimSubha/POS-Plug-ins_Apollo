/*
	Microsoft Dynamics AX for Retail POS Upgrade Database Script
	DbVersion: 6.2.7.0
*/

CREATE TABLE [dbo].[EXCEPTIONCODETABLE_BR](
	[EXCEPTIONCODE] [nvarchar](10) NOT NULL DEFAULT(''),
	[TAXFISCALCLASSIFICATIONID] [nvarchar](10) NOT NULL DEFAULT(''),
	[APPROXTAXVALUEIMPORTED] [numeric](32, 16) NOT NULL DEFAULT(0),
	[APPROXTAXVALUENATIONAL] [numeric](32, 16) NOT NULL DEFAULT(0),
	[DATAAREAID] [nvarchar](4) NOT NULL DEFAULT('')
 CONSTRAINT [EXCEPTIONCODETABLE_PK] PRIMARY KEY NONCLUSTERED 
(
	[DATAAREAID] ASC,
	[TAXFISCALCLASSIFICATIONID] ASC,
	[EXCEPTIONCODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TAXFISCALCLASSIFICATION_BR](
	[FISCALCLASSIFICATIONID] [nvarchar](10) NOT NULL DEFAULT(''),
	[APPROXTAXVALUEIMPORTED] [numeric](32, 16) NOT NULL DEFAULT(0),
	[APPROXTAXVALUENATIONAL] [numeric](32, 16) NOT NULL DEFAULT(0),
	[DATAAREAID] [nvarchar](4) NOT NULL DEFAULT('')
 CONSTRAINT [TAXFISCALCLASSIFICATION_BR_PK] PRIMARY KEY CLUSTERED 
(
	[DATAAREAID] ASC,
	[FISCALCLASSIFICATIONID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BRAZILPARAMETERS](
	[DATAAREAID] [nvarchar](4) NOT NULL DEFAULT(''),
	[APPROXTAXVALUESOURCE] [nvarchar](60) NOT NULL DEFAULT(''),
 CONSTRAINT [BRAZILPARAMETERS_PK] PRIMARY KEY CLUSTERED 
(
	[DATAAREAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[INVENTTABLE]
ADD
	[APPROXTAXVALUE_BR] [numeric](32, 16) NOT NULL DEFAULT(0)
GO

/****** Recreating View [dbo].[ASSORTEDINVENTITEMS] ******/
/** Note: This has to be done after droping/adding columns from/to INVENTTABLE **/
ALTER VIEW [dbo].[ASSORTEDINVENTITEMS]
AS
SELECT RCT.RECID AS STORERECID, IT.*, ISNULL(IIGI.ITEMGROUPID, '') AS ITEMGROUPID
FROM INVENTTABLE IT LEFT JOIN INVENTITEMGROUPITEM IIGI ON IT.DATAAREAID = IIGI.ITEMDATAAREAID AND IT.ITEMID = IIGI.ITEMID, RETAILCHANNELTABLE RCT
WHERE EXISTS (
	SELECT RAE.RECID
	FROM RETAILASSORTMENTEXPLODED RAE
	WHERE
		RAE.OMOPERATINGUNITID = RCT.OMOPERATINGUNITID AND
		RAE.ITEMID = IT.ITEMID AND
		RAE.CHANNELDATAAREAID = IT.DATAAREAID AND
		RAE.VALIDFROM <= GETUTCDATE() AND
		RAE.VALIDTO >= GETUTCDATE()
)
GO
