# base_datos
 
 

<img width="1919" height="1007" alt="Captura de pantalla 2026-03-01 202303" src="https://github.com/user-attachments/assets/38f6ebd5-dbdc-4ed8-b1a6-80628d55b29a" />


CREATE DATABASE GestionNegocio;
GO
USE GestionNegocio;

-- Tabla de Auditoría (Para el punto 6)
CREATE TABLE Auditoria (
    IdLog INT PRIMARY KEY IDENTITY(1,1),
    Tabla VARCHAR(50),
    Accion VARCHAR(20),
    Fecha DATETIME DEFAULT GETDATE(),
    Usuario VARCHAR(50)
);

-- Tabla Producto
CREATE TABLE Producto (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    Stock INT NOT NULL CHECK (Stock >= 0)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    IdPedido INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME DEFAULT GETDATE(),
    Cliente VARCHAR(100) NOT NULL,
    IdProducto INT,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    CONSTRAINT FK_Pedido_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

-- Tabla Despacho
CREATE TABLE Despacho (
    IdDespacho INT PRIMARY KEY IDENTITY(1,1),
    IdPedido INT,
    FechaDespacho DATETIME DEFAULT GETDATE(),
    Estado VARCHAR(20) DEFAULT 'Pendiente', -- Pendiente, Enviado, Entregado
    CONSTRAINT FK_Despacho_Pedido FOREIGN KEY (IdPedido) REFERENCES Pedido(IdPedido)
);

-- Inserción de 5 registros por tabla
INSERT INTO Producto VALUES ('Laptop Dell', 1200.00, 15), ('Mouse Optico', 25.50, 50), ('Monitor 24"', 200.00, 10), ('Teclado Mecanico', 85.00, 5), ('Impresora HP', 150.00, 8);
INSERT INTO Pedido (Fecha, Cliente, IdProducto, Cantidad) VALUES (GETDATE(), 'Juan Perez', 1, 1), (GETDATE(), 'Ana Lopez', 2, 3), (GETDATE(), 'Carlos Ruiz', 3, 2), (GETDATE(), 'Marta Sosa', 1, 1), (GETDATE(), 'Juan Perez', 4, 1);
INSERT INTO Despacho (IdPedido, Estado) VALUES (1, 'Enviado'), (2, 'Pendiente'), (3, 'Entregado'), (4, 'Pendiente'), (5, 'Enviado');
