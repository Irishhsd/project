IF OBJECT_ID('trg_UpdateStockStatus', 'TR') IS NOT NULL
BEGIN
	DROP TRIGGER trg_UpdateStockStatus;
END
GO

CREATE TRIGGER trg_UpdateStockStatus
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	--SELECT * FROM Products
	--SELECT * FROM Stock_Status
	IF UPDATE(Current_Stock) OR EXISTS (SELECT 1 FROM inserted)
	BEGIN
		DECLARE @OutOfStockId INT,
				@LowStockId INT,
				@InStockId INT,
				@StockStatusId INT

		SELECT @OutOfStockId = Id
		FROM Stock_Status
		WHERE [Key] = 'OUT_OF_STOCK'

		SELECT @LowStockId = Id
		FROM Stock_Status
		WHERE [Key] = 'LOW_STOCK'

		SELECT @InStockId = Id
		FROM Stock_Status
		WHERE [Key] = 'IN_STOCK'



		IF CURSOR_STATUS('GLOBAL', 'cursor_products') >= -1
		BEGIN 
			CLOSE cursor_products
			DEALLOCATE cursor_products
		END

		DECLARE @ProductId INT,
				@CurrentStock INT,
				@MinStock INT

		DECLARE cursor_products CURSOR FOR
		SELECT Id, 
			   Current_Stock,
			   Min_Stock
		FROM Products

		OPEN cursor_products

		FETCH NEXT FROM cursor_products INTO @ProductId,
											 @CurrentStock,
											 @MinStock;
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(ISNULL(@CurrentStock, 0) = 0)
				SET @StockStatusId = @OutOfStockId
			ELSE IF (@CurrentStock < @MinStock)
				SET @StockStatusId = @LowStockId
			ELSE
				SET @StockStatusId = @InStockId

			UPDATE Products
			SET Stock_Status_Id = @StockStatusId
			WHERE id = @ProductId

			FETCH NEXT FROM  cursor_products INTO @ProductId, @CurrentStock, @MinStock
		END

		CLOSE cursor_products
		DEALLOCATE cursor_products

	END
END