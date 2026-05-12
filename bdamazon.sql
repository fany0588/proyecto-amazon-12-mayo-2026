
-- Base de datos Amazon Compras
CREATE DATABASE IF NOT EXISTS bdamazon;
USE bdamazon;

-- =======================
-- DOMINIO CLIENTE
-- =======================

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    estado_cuenta VARCHAR(50) NOT NULL
);

CREATE TABLE DIRECCION (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    calle VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE METODO_PAGO (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    numero_tarjeta VARCHAR(20),
    fecha_expiracion DATE,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- =======================
-- DOMINIO CATALOGO
-- =======================

CREATE TABLE VENDEDOR (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rfc VARCHAR(20) NOT NULL,
    calificacion DECIMAL(3,2)
);

CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    padre_id INT,
    FOREIGN KEY (padre_id) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE PRODUCTO (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    id_vendedor INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id_vendedor)
);

-- =======================
-- DOMINIO PEDIDO
-- =======================

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATETIME NOT NULL,
    estado VARCHAR(50) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_direccion INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_direccion) REFERENCES DIRECCION(id_direccion)
);

CREATE TABLE ITEM_PEDIDO (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

CREATE TABLE PAGO (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_metodo_pago) REFERENCES METODO_PAGO(id_metodo_pago)
);

-- =======================
-- DOMINIO LOGISTICO
-- =======================

CREATE TABLE TRANSPORTISTA (
    id_transportista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ENVIO (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_transportista INT NOT NULL,
    numero_guia VARCHAR(100),
    estado VARCHAR(50) NOT NULL,
    fecha_envio DATETIME,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_transportista) REFERENCES TRANSPORTISTA(id_transportista)
);

-- =======================
-- RESEÑAS
-- =======================

CREATE TABLE RESENA (
    id_resena INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    calificacion INT NOT NULL,
    comentario TEXT,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);
