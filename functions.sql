USE tienda;

-- 1. Obtener el precio promedio de los productos de un fabricante.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_rom_pro_fab;
CREATE FUNCTION IF NOT EXISTS fn_rom_pro_fab(cod_fab INT)
RETURNS DECIMAL(10, 2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(10, 2);
    SELECT AVG(precio) INTO promedio
    FROM producto
    WHERE id_fabricante = cod_fab;

    RETURN promedio;
END $$
DELIMITER;

SELECT fn_rom_pro_fab(1) as precioPromedio;

-- 2. Calcular el precio total de todos los productos de un fabricante.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_calc_total_pre_pro;
CREATE FUNCTION IF NOT EXISTS fn_calc_total_pre_pro(cod_fab INT)
RETURNS DECIMAL(10, 2)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE totalPrecio DECIMAL(10, 2);
    SELECT SUM(precio) INTO totalPrecio
    FROM producto
    WHERE id_fabricante = cod_fab;

    RETURN totalPrecio;
END $$
DELIMITER;

SELECT fn_calc_total_pre_pro(1) as totalPrecio;

-- 3. Obtener el nombre del producto más caro.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_pro_caro;
CREATE FUNCTION IF NOT EXISTS fn_pro_caro()
RETURNS VARCHAR(100)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE nombreProducto VARCHAR(100);
    SELECT nombre INTO nombreProducto
    FROM producto
    ORDER BY precio DESC
    LIMIT 1;

    RETURN nombreProducto;
END $$
DELIMITER;

SELECT fn_pro_caro() as ProductoMasCaro;

-- 4. Contar la cantidad de productos disponibles de un fabricante.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_pro_disp_fab;
CREATE FUNCTION IF NOT EXISTS fn_pro_disp_fab(cod_fab INT)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE totalProductos INT;
    -- IF NOT EXISTS (SELECT 1 FROM producto WHERE id_fabricante = cod_fab)
    --     SIGNAL SQLSTATE VALUE '40001'
    --         SET MESSAGE_TEXT = 'no existe un fabricante con ese ID';
    -- END IF;

    SELECT COUNT(id) INTO totalProductos
    FROM producto
    WHERE id_fabricante = cod_fab;
    RETURN totalProductos;
END $$
DELIMITER;

SELECT fn_pro_disp_fab(1) as totalProductos;

-- 5. Obtener el precio mínimo de los productos de un fabricante.
DELIMITER $$
DROP FUNCTION IF EXISTS fn_pre_min_pro;
CREATE FUNCTION IF NOT EXISTS fn_pre_min_pro(cod_fab INT)
RETURNS VARCHAR(100)
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE precioMinimo DECIMAL(10, 2);

    SELECT precio INTO precioMinimo
    FROM producto
    WHERE id_fabricante = cod_fab
    ORDER BY precio ASC
    LIMIT 1;
    RETURN precioMinimo;
END $$
DELIMITER;

SELECT fn_pre_min_pro(1) as precioMinimo;