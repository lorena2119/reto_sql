CREATE DATABASE tienda;
USE tienda;

CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante (id, nombre) VALUES
(1, 'Apple'),
(2, 'Dell'),
(3, 'Sony'),
(4, 'LG'),
(5, 'Microsoft'),
(6, 'Samsung'),
(7, 'Razer'),
(8, 'Acer'),
(9, 'Huawei');

INSERT INTO producto (id, nombre, precio, id_fabricante) VALUES
(1, 'iPhone 15 Pro', 999.99, 1),
(2, 'MacBook Pro 16" M2', 2499.99, 1),
(3, 'Dell XPS 13', 1499.99, 2),
(4, 'Sony WH-1000XM5', 349.99, 3),
(5, 'LG OLED55CX', 1499.99, 4),
(6, 'Microsoft Surface Laptop 5', 1499.99, 5),
(7, 'Samsung Galaxy Z Fold 5', 1799.99, 6),
(8, 'Razer Blade 15', 1999.99, 7),
(9, 'Acer Predator Helios 300', 1399.99, 8),
(10, 'Huawei MateBook X Pro', 1799.99, 9);
