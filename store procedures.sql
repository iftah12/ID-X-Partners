USE [DWH_Project]
GO
/****** Object:  StoredProcedure [dbo].[summary_order_status]    Script Date: 01/06/2023 08:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[summary_order_status] 
(
@StatusID int
)
AS
BEGIN
	SELECT OrderID, CustomerName, ProductName, Quantity, StatusOrder
	FROM FactSalesOrder a
	INNER JOIN DimCustomer b ON a.CustomerID = b.CustomerID
	INNER JOIN DimStatusOrder c ON a.StatusID = c.StatusID
	INNER JOIN DimProduct d ON a.ProductID = d.ProductID
	WHERE a.StatusID = @StatusID
END;
