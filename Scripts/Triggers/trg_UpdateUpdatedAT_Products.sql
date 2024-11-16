IF OBJECT_ID('trg_UpdateUpdatedAt_Products', 'TR') IS NOT NULL
BEGIN
	DROP TRIGGER trg_UpdateUpdatedAt_Products;
END
GO

CREATE TRIGGER trg_UpdateUpdatedAt_Products
ON [dbo].[Products]
AFTER INSERT, UPDATE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Products
	SET Updated_At = GETDATE()
	FROM inserted i
	WHERE Products.Id = i.Id

END