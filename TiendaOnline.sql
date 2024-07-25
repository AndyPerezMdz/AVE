USE TiendaOnline;
GO

-- Creación de tablas
CREATE TABLE Users (
  UserId INT PRIMARY KEY IDENTITY(1,1),
  Username NVARCHAR(50) NOT NULL,
  Email NVARCHAR(50) NOT NULL UNIQUE,
  PasswordHash NVARCHAR(255) NOT NULL,
  CreatedAt DATETIME DEFAULT GETDATE()
);

-- Inserción de datos de muestra
INSERT INTO Users (Username, Email, PasswordHash) VALUES 
('JohnDoe', 'johndoe@example.com', 'hashedpassword1'),
('JaneSmith', 'janesmith@example.com', 'hashedpassword2'),
('AliceJones', 'alicejones@example.com', 'hashedpassword3');

-- Ver tabla
SELECT * FROM Users;

-- Eliminaré tablas que no usaré
DROP TABLE dbo.Cart;
DROP TABLE dbo.CartItems;
DROP TABLE dbo.OrderItems;
DROP TABLE dbo.Orders;
DROP TABLE dbo.Products;
DROP TABLE dbo.Users;

------------------------ CRUD -----------------------------------

-- Agregar usuario.
USE TiendaOnline
GO
CREATE PROCEDURE AgregarUsuario
	@Username NVARCHAR(50),
	@Email NVARCHAR(50),
	@PasswordHash NVARCHAR(255)
AS
BEGIN
	INSERT INTO Users (Username, Email, PasswordHash)
	VALUES (@Username, @Email, @PasswordHash);
END;
GO

-- Eliminar usuario.
USE TiendaOnline
GO
CREATE PROCEDURE EliminarUsuario
	@UserID INT
AS
BEGIN
	DELETE FROM Users
	WHERE UserId = @UserID;
END;
GO

-- Actualizar usuario.
USE TiendaOnline
GO
CREATE PROCEDURE ActualizarUsuario
	@UserID INT,
	@Username NVARCHAR(50),
	@Email NVARCHAR(50),
	@PasswordHash NVARCHAR(255)
AS
BEGIN
	UPDATE Users
	SET Username = @Username,
		Email = @Email,
		PasswordHash = @PasswordHash
	WHERE UserId = @UserID;
END;
GO
