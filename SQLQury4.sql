SELECT 
    p.IdPedido,
    p.Fecha,
    p.Cliente,
    pr.Nombre AS NombreProducto,
    p.Cantidad,
    (p.Cantidad * pr.Precio) AS Subtotal
FROM Pedido p
INNER JOIN Producto pr ON p.IdProducto = pr.IdProducto;