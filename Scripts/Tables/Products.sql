IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Products]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--ALmacenar los productos
	CREATE TABLE [dbo].[Products]
	(
	[Id]					INT NOT NULL PRIMARY KEY IDENTITY(1,1), --Identificador principal de la tabla Products
	[Name]					VARCHAR(255) NOT NULL, --Nombre del producto
	[Description]			TEXT NOT NULL, --Descripci�n del producto (detallada)
	[Price]					DECIMAL(18,2), --Precio del producto
	[Current_Stock]			INT NOT NULL, --Existencia actual del producto
	[Max_Stock]				INT NOT NULL, --Existencia m�xima del producto
	[Min_Stock]				INT NOT NULL, --Existencia m�nima del producto
	[Stock_Status_Id]	INT NOT NULL, --Relaci�n con la tabla Stock_Status
	[Image_Path]			VARCHAR(255), --Ruta de la imagen
	[Created_At]			DATETIME DEFAULT GETDATE(), --Fecha de creaci�n del producto
	[Updated_At]			DATETIME DEFAULT GETDATE() --Fecha de la �ltima actualizaci�n del producto
	FOREIGN KEY ([Stock_Status_Id]) REFERENCES [dbo].[Stock_Status]([Id])
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informaci�n b�sica de los productos, as� como la existencia actual y su control',
  'SCHEMA', 'dbo', 'table', 'Products'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informaci�n b�sica de los productos, as� como la existencia actual y su control',
  'SCHEMA', 'dbo', 'table', 'Products'
END
GO


/*  Comentarios para las columnas */
IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Id'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Identificador principal de la tabla Products', 'Schema', [dbo], 'table', [Products], 'column', [Id];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla Products', 'Schema', [dbo], 'table', [Products], 'column', [Id];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Name'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Nombre del producto', 'Schema', [dbo], 'table', [Products], 'column', [Name];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Nombre del producto', 'Schema', [dbo], 'table', [Products], 'column', [Name];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Description'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Descripci�n del producto (detallada)', 'Schema', [dbo], 'table', [Products], 'column', [Description];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Descripci�n del producto (detallada)', 'Schema', [dbo], 'table', [Products], 'column', [Description];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Price'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Precio del producto', 'Schema', [dbo], 'table', [Products], 'column', [Price];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Precio del producto', 'Schema', [dbo], 'table', [Products], 'column', [Price];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Current_Stock'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Existencia actual del producto', 'Schema', [dbo], 'table', [Products], 'column', [Current_Stock];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Existencia actual del producto', 'Schema', [dbo], 'table', [Products], 'column', [Current_Stock];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Max_Stock'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Existencia m�xima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Max_Stock];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Existencia m�xima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Max_Stock];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Min_Stock'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Existencia m�nima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Min_Stock];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Existencia m�nima del producto', 'Schema', [dbo], 'table', [Products], 'column', [Min_Stock];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Stock_Status_Id'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Relaci�n con la tabla Stock_Status', 'Schema', [dbo], 'table', [Products], 'column', [Stock_Status_Id];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Relaci�n con la tabla Stock_Status', 'Schema', [dbo], 'table', [Products], 'column', [Stock_Status_Id];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Image_Path'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Ruta de la imagen', 'Schema', [dbo], 'table', [Products], 'column', [Image_Path];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Ruta de la imagen', 'Schema', [dbo], 'table', [Products], 'column', [Image_Path];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Created_At'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Fecha de creaci�n del producto', 'Schema', [dbo], 'table', [Products], 'column', [Created_At];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creaci�n del producto', 'Schema', [dbo], 'table', [Products], 'column', [Created_At];

IF EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Products', 'column', 'Updated_At'))
    EXEC sp_updateextendedproperty 'MS_Description', 'Fecha de la �ltima actualizaci�n del producto', 'Schema', [dbo], 'table', [Products], 'column', [Updated_At];
ELSE
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de la �ltima actualizaci�n del producto', 'Schema', [dbo], 'table', [Products], 'column', [Updated_At];
