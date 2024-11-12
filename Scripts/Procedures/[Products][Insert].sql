-- Author:		Iris Saucedo
-- Description:	Inserta productos
-- Fecha:		09/11/2024
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[Insert]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[Insert]
GO
CREATE PROCEDURE [Products].[Insert]
	 @Name				VARCHAR(255),  --PARÁMETROS QUE RECIBE EL STROCK_PRODUCT NO NULL
	 @Description		TEXT,
	 @Price				DECIMAL(18,2),
	 @Current_Stock		INT,
	 @Max_Stock			INT,
	 @Min_Stock			INT,
	 @Image_Path		VARCHAR(255)
WITH  ENCRYPTION  
AS 
BEGIN
  INSERT INTO Products (Name, Description, Price, Current_Stock, Max_Stock, Min_Stock, Image_Path)   --Las dos coumnas que faltan toman fecha
	VALUES (@Name, @Description, @Price, @Current_Stock, @Max_Stock, @Min_Stock, @Image_Path)
END
GO
EXEC sp_recompile N'[Products].[Insert]';
GO