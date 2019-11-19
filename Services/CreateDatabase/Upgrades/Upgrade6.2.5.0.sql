/*
	Microsoft Dynamics AX for Retail POS Upgrade Database Script
	DbVersion: 6.2.5.0
*/

/*
	Flag to indicate if receipt was voided after end receipt
	Printed total discount at the fiscal receipt
*/
ALTER TABLE [dbo].[RETAILFISCALRECEIPT_BR]
ADD
	[VOIDEDAFTERENDRECEIPT] [int] NOT NULL DEFAULT (0),
	[PRINTEDTOTALDISCOUNTAMOUNT] [numeric](32, 16) NOT NULL DEFAULT(0),
	[PRINTEDTOTALSURCHARGEAMOUNT] [numeric](32, 16) NOT NULL DEFAULT(0)
GO

/*
	Printed line discount at the fiscal receipt line
*/
ALTER TABLE [dbo].[RETAILFISCALRECEIPTLINE_BR]
ADD
	[PRINTEDLINEDISCOUNTAMOUNT] [numeric](32, 16) NOT NULL DEFAULT(0),
	[PRINTEDLINESURCHARGEAMOUNT] [numeric](32, 16) NOT NULL DEFAULT(0)
GO

/*
	Populate the new printed discount fields
	(idempotent script)
*/
UPDATE RECEIPT
	SET RECEIPT.PRINTEDTOTALDISCOUNTAMOUNT = TRANS.TOTALDISCAMOUNT
	FROM RETAILFISCALRECEIPT_BR AS RECEIPT
	INNER JOIN RETAILTRANSACTIONTABLE AS TRANS
	ON TRANS.STORE = RECEIPT.STOREID
		AND TRANS.TERMINAL = RECEIPT.TERMINALID
		AND TRANS.TRANSACTIONID = RECEIPT.TRANSACTIONID
GO

UPDATE RECEIPTLINE
	SET RECEIPTLINE.PRINTEDLINEDISCOUNTAMOUNT = TRANSLINE.LINEDSCAMOUNT
	FROM RETAILFISCALRECEIPTLINE_BR AS RECEIPTLINE
	INNER JOIN RETAILTRANSACTIONSALESTRANS AS TRANSLINE
	ON TRANSLINE.STORE = RECEIPTLINE.STOREID
		AND TRANSLINE.TERMINALID = RECEIPTLINE.TERMINALID
		AND TRANSLINE.TRANSACTIONID = RECEIPTLINE.TRANSACTIONID
		AND TRANSLINE.LINENUM = RECEIPTLINE.LINENUM
GO

/*
	Update the CFOP codes at both Fiscal receipt and Fiscal document model 02 line tables
	(idempotent script)
*/
UPDATE RETAILFISCALRECEIPTLINE_BR SET CFOP = '5.101' WHERE CFOP = '5101'
UPDATE RETAILFISCALRECEIPTLINE_BR SET CFOP = '5.102' WHERE CFOP = '5102'
UPDATE RETAILFISCALRECEIPTLINE_BR SET CFOP = '5.405' WHERE CFOP = '5405'
UPDATE RETAILFISCALRECEIPTLINE_BR SET CFOP = '5.933' WHERE CFOP = '5933'
GO

UPDATE RETAILFISCALDOCUMENTMODEL2LINE_BR SET CFOP = '5.101' WHERE CFOP = '5101'
UPDATE RETAILFISCALDOCUMENTMODEL2LINE_BR SET CFOP = '5.102' WHERE CFOP = '5102'
UPDATE RETAILFISCALDOCUMENTMODEL2LINE_BR SET CFOP = '5.405' WHERE CFOP = '5405'
UPDATE RETAILFISCALDOCUMENTMODEL2LINE_BR SET CFOP = '5.933' WHERE CFOP = '5933'
GO

