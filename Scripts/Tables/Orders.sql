IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--Almacena la informaci�n sobre los pedidos realizados
	CREATE TABLE [dbo].[Orders]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), --Identificador �nicol
		[Total price] DECIMAL (20, 2) NOT NULL, --Precio total del pedido
		[Status] VARCHAR(50) NOT NULL, --Estado del pedido (e.g., pendiente, e)
		[Created_At] DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de creaci�n de la orden
		[Update_At] DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de��ltima�actualizaci�n de la orden
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informaci�n sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informaci�n sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END
GO


/*  Comentarios para las columnas */
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador �nico de la orden', 'Schema', [dbo], 'table', [Orders], 'column', [Id];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Total price'))
    EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', [dbo], 'table', [Orders], 'column', [Total price];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
    EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido (e.g., pendiente)', 'Schema', [dbo], 'table', [Orders], 'column', [Status];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creaci�n de la orden', 'Schema', [dbo], 'table', [Orders], 'column', [Created_At];

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Update_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de �ltima actualizaci�n de la orden', 'Schema', [dbo], 'table', [Orders], 'column', [Update_At];
