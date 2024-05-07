# La Argentina Store

<p align="center">
  <img src="https://raw.githubusercontent.com/eOrrego/La_Argentina_Store/main/logo_LaArgentina.png" alt="Logo La Argentina">
</p>

# Temática del Proyecto

El proyecto se centra en el desarrollo de un sistema de comercio electrónico para "La Argentina", una tienda de ropa especializada en la fabricación de modelos exclusivos para hombres y mujeres. El sistema proporcionará una plataforma en línea donde los clientes puedan explorar, seleccionar y adquirir productos únicos fabricados por la marca.

## Descripción del Proyecto

El sistema incluirá las siguientes características principales:

1. **Gestión de Usuarios**: Se implementará un sistema de gestión de usuarios que incluirá diferentes roles, como administradores, publicadores y clientes. Cada rol tendrá permisos específicos dentro del sistema para garantizar un control seguro y eficiente del acceso a la plataforma.

2. **Gestión de Inventario**: Se llevará un seguimiento del stock de productos por depósitos, asegurando la disponibilidad de los productos en todo momento. Esto permitirá una gestión eficiente del inventario y evitará la sobreventa de productos.

3. **Proceso de Compra**: Los clientes podrán realizar compras de forma segura a través de la plataforma. Se proporcionará un proceso de compra intuitivo y fácil de usar que incluirá la selección de productos, la revisión del carrito de compras, la selección de opciones de envío y pago, y la confirmación del pedido.

4. **Gestión de Pedidos**: Se registrará información detallada sobre cada pedido realizado, incluyendo el usuario que realizó el pedido, el estado del pedido, los productos seleccionados y la fecha de compra. Esto permitirá un seguimiento preciso del estado de cada pedido y facilitará la atención al cliente.

5. **Direcciones de Envío y Métodos de Pago**: Se permitirá a los usuarios almacenar múltiples direcciones de envío y métodos de pago en sus perfiles. Esto facilitará el proceso de compra al permitir a los clientes seleccionar rápidamente la dirección de envío y el método de pago preferidos durante el proceso de compra.

## Diagrama ER

![Diagrama ER](https://raw.githubusercontent.com/eOrrego/La_Argentina_Store/main/DiagramER.png)

## Listado de Tablas y Campos

A continuación se presenta un listado de las tablas que comprenden la base de datos, junto con una descripción de cada tabla y los campos asociados:

1. ## User (Usuario)

- user_id (ID de usuario, PK): INT - Identificador único del usuario.
- full_name (Nombre completo): VARCHAR - Nombre completo del usuario.
- email (Correo electrónico): VARCHAR - Dirección de correo electrónico del usuario.
- password (Contraseña): VARCHAR - Contraseña del usuario.

2. ## Role (Rol)

- role_id (ID de rol, PK): INT - Identificador único del rol.
- role_name (Nombre de rol): VARCHAR - Nombre descriptivo del rol.

3. ## UserRole (Relación Usuario-Rol)

- user_id (ID de usuario, FK): INT - Identificador del usuario.
- role_id (ID de rol, FK): INT - Identificador del rol.

4. ## State (Estado)

- state_id (ID de estado, PK): INT - Identificador único del estado.
- state_name (Nombre de estado): VARCHAR - Nombre descriptivo del estado.
- description (Descripción): TEXT - Descripción del estado.

5. ## OrderDetail (Detalle de Pedido)

- order_detail_id (ID de detalle de pedido, PK): INT - Identificador único del detalle de pedido.
- user_id (ID de usuario, FK): INT - Identificador del usuario asociado al pedido.
- state_id (ID de estado, FK): INT - Identificador del estado del pedido.
- order_date (Fecha de pedido): DATETIME - Fecha en que se realizó el pedido.

6. ## Product (Producto)

- product_id (ID de producto, PK): INT - Identificador único del producto.
- product_name (Nombre de producto): VARCHAR - Nombre descriptivo del producto.
- description (Descripción): TEXT - Descripción del producto.
- price (Precio): DECIMAL - Precio del producto.
- stock (Stock): INT - Cantidad disponible en stock del producto.

7. ## OrderProduct (Relación Pedido-Producto)

- order_detail_id (ID de detalle de pedido, FK): INT - Identificador del detalle de pedido.
- product_id (ID de producto, FK): INT - Identificador del producto.

8. ## Session (Sesión)

- session_id (ID de sesión, PK): INT - Identificador único de la sesión.
- user_id (ID de usuario, FK): INT - Identificador del usuario asociado a la sesión.
- start_date (Fecha de inicio): DATETIME - Fecha y hora de inicio de la sesión.
- end_date (Fecha de fin): DATETIME - Fecha y hora de fin de la sesión.

9. ## AccessHistory (Historial de Acceso)

- history_id (ID de historial, PK): INT - Identificador único del registro en el historial.
- user_id (ID de usuario, FK): INT - Identificador del usuario asociado al acceso.
- access_date (Fecha de acceso): DATETIME - Fecha y hora en que se realizó el acceso.
- action (Acción): VARCHAR - Descripción de la acción realizada durante el acceso.

10. ## ShippingAddress (Dirección de Envío)

- address_id (ID de dirección, PK): INT - Identificador único de la dirección de envío.
- user_id (ID de usuario, FK): INT - Identificador del usuario asociado a la dirección de envío.
- address (Dirección): VARCHAR - Dirección de envío.
- city (Ciudad): VARCHAR - Ciudad de envío.
- postal_code (Código Postal): VARCHAR - Código postal de la dirección de envío.
- country (País): VARCHAR - País de envío.

11. ## PaymentMethod (Método de Pago)

- method_id (ID de método de pago, PK): INT - Identificador único del método de pago.
- user_id (ID de usuario, FK): INT - Identificador del usuario asociado al método de pago.
- type (Tipo): VARCHAR - Tipo de método de pago (tarjeta de crédito, débito, etc.).
- number (Número): VARCHAR - Número de la tarjeta o método de pago.
- expiration_date (Fecha de vencimiento): DATE - Fecha de vencimiento del método de pago.

12. ## OrderShippingAddress (Relación Pedido-Dirección de Envío)

- order_detail_id (ID de detalle de pedido, FK): INT - Identificador del detalle de pedido.
- address_id (ID de dirección, FK): INT - Identificador de la dirección de envío.

13. ## OrderPaymentMethod (Relación Pedido-Método de Pago)

- order_detail_id (ID de detalle de pedido, FK): INT - Identificador del detalle de pedido.
- method_id (ID de método de pago, FK): INT - Identificador del método de pago.


## Vistas

1. ## UserRolesView

- Objetivo/Beneficio: Proporciona una vista que muestra los roles asignados a cada usuario.
- Tablas involucradas: User, UserRole, Role.

2. ## PendingOrdersView

- Objetivo/Beneficio: Ofrece una vista que muestra los pedidos pendientes de procesar.
- Tablas involucradas: OrderDetail, State.

3. ## OutOfStockProductsView

- Objetivo/Beneficio: Permite visualizar los productos que están fuera de stock.
- Tablas involucradas: Product.

## Funciones

1. ## CalculateOrderTotal

- Objetivo/Beneficio: Calcula el total de un pedido sumando los precios de los productos.
- Tablas involucradas: OrderProduct, Product.

2. ## CountProductsInOrder

- Objetivo/Beneficio: Cuenta la cantidad de productos en un pedido.
- Tablas involucradas: OrderProduct.

3. ## GetCurrentOrderState

- Objetivo/Beneficio: Obtiene el estado actual de un pedido.
- Tablas involucradas: OrderDetail, State.

## Stored Procedures

1. ## RegisterUser

- Objetivo/Beneficio: Registra un nuevo usuario en la base de datos.
- Tablas involucradas: User.

2. ## UpdateUserInfo

- Objetivo/Beneficio: Actualiza la información de un usuario existente.
- Tablas involucradas: User.

3. ## DeleteUser

- Objetivo/Beneficio: Elimina un usuario de la base de datos.
- Tablas involucradas: User.

## Triggers

1. ## LogUserAccess

- Objetivo/Beneficio: Registra el acceso de un usuario a la sesión.
- Tablas involucradas: Session, AccessHistory.

2. ## NotifyAdminOfPendingOrder

- Objetivo/Beneficio: Notifica al administrador sobre un nuevo pedido pendiente.
- Tablas involucradas: OrderDetail, State, AdminNotifications.

3. ## UpdateProductStock

- Objetivo/Beneficio: Actualiza el stock de productos después de agregar un nuevo pedido.
- Tablas involucradas: OrderProduct, Product.


## Script de Creación de Base de Datos y Tablas

```sql
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS LaArgentinaStore;

-- Uso de la base de datos
USE LaArgentinaStore;

-- Tabla User (Usuario)
CREATE TABLE IF NOT EXISTS User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Tabla Role (Rol)
CREATE TABLE IF NOT EXISTS Role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL
);

-- Tabla UserRole (Relación Usuario-Rol)
CREATE TABLE IF NOT EXISTS UserRole (
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    PRIMARY KEY (user_id, role_id)
);

-- Tabla State (Estado)
CREATE TABLE IF NOT EXISTS State (
    state_id INT AUTO_INCREMENT PRIMARY KEY,
    state_name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Tabla OrderDetail (Detalle de Pedido)
CREATE TABLE IF NOT EXISTS OrderDetail (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    state_id INT,
    order_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (state_id) REFERENCES State(state_id)
);

-- Tabla Product (Producto)
CREATE TABLE IF NOT EXISTS Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    stock INT
);

-- Tabla OrderProduct (Relación Pedido-Producto)
CREATE TABLE IF NOT EXISTS OrderProduct (
    order_detail_id INT,
    product_id INT,
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    PRIMARY KEY (order_detail_id, product_id)
);

-- Tabla Session (Sesión)
CREATE TABLE IF NOT EXISTS Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_date DATETIME,
    end_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Tabla AccessHistory (Historial de Acceso)
CREATE TABLE IF NOT EXISTS AccessHistory (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    access_date DATETIME,
    action VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Tabla ShippingAddress (Dirección de Envío)
CREATE TABLE IF NOT EXISTS ShippingAddress (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address VARCHAR(255),
    city VARCHAR(255),
    postal_code VARCHAR(20),
    country VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Tabla PaymentMethod (Método de Pago)
CREATE TABLE IF NOT EXISTS PaymentMethod (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type VARCHAR(255),
    number VARCHAR(255),
    expiration_date DATE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Tabla OrderShippingAddress (Relación Pedido-Dirección de Envío)
CREATE TABLE IF NOT EXISTS OrderShippingAddress (
    order_detail_id INT,
    address_id INT,
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (address_id) REFERENCES ShippingAddress(address_id),
    PRIMARY KEY (order_detail_id, address_id)
);

-- Tabla OrderPaymentMethod (Relación Pedido-Método de Pago)
CREATE TABLE IF NOT EXISTS OrderPaymentMethod (
    order_detail_id INT,
    method_id INT,
    FOREIGN KEY (order_detail_id) REFERENCES OrderDetail(order_detail_id),
    FOREIGN KEY (method_id) REFERENCES PaymentMethod(method_id),
    PRIMARY KEY (order_detail_id, method_id)
);

-- Vistas

-- Vista que muestra los roles asignados a cada usuario.
CREATE VIEW UserRolesView AS
SELECT u.user_id, u.full_name, u.email, r.role_name
FROM User u
JOIN UserRole ur ON u.user_id = ur.user_id
JOIN Role r ON ur.role_id = r.role_id;

-- Vista que muestra los pedidos pendientes de procesar.
CREATE VIEW PendingOrdersView AS
SELECT od.order_detail_id, od.user_id, od.state_id, od.order_date
FROM OrderDetail od
JOIN State s ON od.state_id = s.state_id
WHERE s.state_name = 'Pending';

-- Vista que muestra los productos que están fuera de stock.
CREATE VIEW OutOfStockProductsView AS
SELECT *
FROM Product
WHERE stock = 0;

-- Funciones

-- Función para calcular el total de un pedido.
DELIMITER //
CREATE FUNCTION CalculateOrderTotal(orderId INT) RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Product.price)
    INTO total
    FROM OrderProduct
    INNER JOIN Product ON OrderProduct.product_id = Product.product_id
    WHERE OrderProduct.order_detail_id = orderId;
    RETURN total;
END;
//

-- Función para contar la cantidad de productos en un pedido.
DELIMITER //
CREATE FUNCTION CountProductsInOrder(orderId INT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE productCount INT;
    SELECT COUNT(*)
    INTO productCount
    FROM OrderProduct
    WHERE order_detail_id = orderId;
    RETURN productCount;
END;
//

-- Función para obtener el estado actual de un pedido.
DELIMITER //
CREATE FUNCTION GetCurrentOrderState(orderId INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
    DECLARE currentState VARCHAR(255);
    SELECT State.state_name
    INTO currentState
    FROM OrderDetail
    INNER JOIN State ON OrderDetail.state_id = State.state_id
    WHERE OrderDetail.order_detail_id = orderId;
    RETURN currentState;
END;
//

-- Stored Procedures

-- Procedimiento para registrar un nuevo usuario.
DELIMITER //
CREATE PROCEDURE RegisterUser(
    IN fullName VARCHAR(255),
    IN email VARCHAR(255),
    IN pass VARCHAR(255)
)
BEGIN
    INSERT INTO User (full_name, email, password)
    VALUES (fullName, email, pass);
END //
DELIMITER ;

-- Procedimiento para actualizar la información de un usuario.
DELIMITER //
CREATE PROCEDURE UpdateUserInfo(
    IN userId INT,
    IN newFullName VARCHAR(255),
    IN newEmail VARCHAR(255)
)
BEGIN
    UPDATE User
    SET full_name = newFullName,
        email = newEmail
    WHERE user_id = userId;
END //
DELIMITER ;

-- Procedimiento para eliminar un usuario.
DELIMITER //
CREATE PROCEDURE DeleteUser(
    IN userId INT
)
BEGIN
    DELETE FROM User WHERE user_id = userId;
END //
DELIMITER ;

-- Triggers

-- Trigger para registrar el acceso de un usuario.
DELIMITER //
CREATE TRIGGER LogUserAccess
AFTER INSERT ON Session
FOR EACH ROW
BEGIN
    INSERT INTO AccessHistory (user_id, access_date, action)
    VALUES (NEW.user_id, NEW.start_date, 'Login');
END //
DELIMITER ;

-- Trigger para notificar al administrador sobre un nuevo pedido pendiente.
DELIMITER //
CREATE TRIGGER NotifyAdminOfPendingOrder
AFTER INSERT ON OrderDetail
FOR EACH ROW
BEGIN
    IF NEW.state_id = (SELECT state_id FROM State WHERE state_name = 'Pending') THEN
        INSERT INTO AdminNotifications (order_id, notification_date)
        VALUES (NEW.order_detail_id, NOW());
    END IF;
END //
DELIMITER ;

-- Trigger para actualizar el stock de productos después de agregar un nuevo pedido.
DELIMITER $$
CREATE TRIGGER update_product_stock AFTER INSERT ON OrderProduct
FOR EACH ROW
BEGIN
    DECLARE product_quantity INT;
    
    -- Obtener la cantidad del producto del pedido
    SELECT quantity INTO product_quantity
    FROM OrderDetail
    WHERE order_detail_id = NEW.order_detail_id;
    
    -- Actualizar el stock del producto
    UPDATE Product
    SET stock = stock - product_quantity
    WHERE product_id = NEW.product_id;
END$$
DELIMITER ;
```

## Observaciones

- Cada tabla se ha diseñado siguiendo las buenas prácticas de modelado de bases de datos, garantizando la integridad de los datos y la eficiencia en el acceso.
- Se han establecido relaciones entre las tablas utilizando claves primarias y foráneas para mantener la coherencia de los datos.
- La estructura de la base de datos permite un seguimiento detallado de los pedidos, la gestión de usuarios y la administración del inventario.
- Se han implementado vistas que proporcionan información útil sobre los usuarios, los pedidos pendientes y los productos fuera de stock.
- Las funciones agregadas facilitan el cálculo del total de un pedido, la contabilización de productos en un pedido y la obtención del estado actual de un pedido.
- Los stored procedures permiten registrar nuevos usuarios, actualizar su información y eliminar usuarios de manera segura y eficiente.
- Los triggers agregan funcionalidades automatizadas al sistema, como registrar el acceso de usuarios, notificar al administrador sobre nuevos pedidos pendientes y actualizar el stock de productos después de agregar un nuevo pedido.
