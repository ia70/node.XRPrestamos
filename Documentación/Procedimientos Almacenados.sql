CREATE PROCEDURE `cartera_clientes` (IN usuario varchar(50))
BEGIN
SELECT e.nombre, e.apellido_paterno, e.apellido_materno, f.monto_total, SUM(g.monto) AS pagado, (f.monto_total - SUM(g.monto)) AS restante FROM usuario a
INNER JOIN usuario_ruta AS b ON b.id_usuario = a.id_usuario
INNER JOIN ruta AS c ON c.id_ruta = b.id_ruta
INNER JOIN usuario_establecimiento AS d ON d.id_ruta = c.id_ruta
INNER JOIN persona AS e ON e.ine_clave = d.ine_clave
RIGHT JOIN credito AS f ON f.ine_clave = e.ine_clave
LEFT JOIN abono AS g ON g.id_credito = f.id_credito 

WHERE a.id_usuario = usuario GROUP BY f.id_credito;

END