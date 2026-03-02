-- 1. Crear la base de datos
CREATE DATABASE citas;
GO

-- 2. Usar la nueva base de datos
USE citas;
GO

-- 3. Crear la tabla con los nombres de columna que espera tu código
CREATE TABLE Reservas (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombreCliente VARCHAR(100),
    nombrePerrito VARCHAR(100),
    whatsapp VARCHAR(20),
    razaPerrito VARCHAR(50),
    servicioSeleccionado VARCHAR(100),
    precioFinal DECIMAL(10,2),
    fechaCita DATETIME,
    cantidadPerritos INT DEFAULT 1,
    estado VARCHAR(20) DEFAULT 'Pendiente'
);
GO
