-- Crear la base de datos
CREATE DATABASE TareaConcesionaria;
GO

USE TareaConcesionaria;
GO

-- Crear la tabla de carros
CREATE TABLE Carros (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100),
    marca VARCHAR(50),
    anio INT,
    precio DECIMAL(18,2),
    url_imagen VARCHAR(MAX) -- Aquí se guarda el link de la foto
);

-- Insertar un ejemplo para probar
INSERT INTO Carros (nombre, marca, anio, precio, url_imagen) 
VALUES ('Civic', 'Honda', 2024, 25000, 'https://acortar.link/uV7Gz4');