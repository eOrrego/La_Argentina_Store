# Temática del Proyecto

El proyecto se centra en el desarrollo de un sistema de comercio electrónico para "La Argentina", una tienda de ropa especializada en la fabricación de modelos exclusivos para hombres y mujeres. El sistema proporcionará una plataforma en línea donde los clientes puedan explorar, seleccionar y adquirir productos únicos fabricados por la marca.

## Diagrama ER

![Diagrama ER](https://raw.githubusercontent.com/eOrrego/La_Argentina_Store/main/DiagramER.png)

## Descripción del Proyecto

El sistema incluirá las siguientes características principales:

1. **Gestión de Usuarios**: Se implementará un sistema de gestión de usuarios que incluirá diferentes roles, como administradores, publicadores y clientes. Cada rol tendrá permisos específicos dentro del sistema para garantizar un control seguro y eficiente del acceso a la plataforma.

2. **Gestión de Inventario**: Se llevará un seguimiento del stock de productos por depósitos, asegurando la disponibilidad de los productos en todo momento. Esto permitirá una gestión eficiente del inventario y evitará la sobreventa de productos.

3. **Proceso de Compra**: Los clientes podrán realizar compras de forma segura a través de la plataforma. Se proporcionará un proceso de compra intuitivo y fácil de usar que incluirá la selección de productos, la revisión del carrito de compras, la selección de opciones de envío y pago, y la confirmación del pedido.

4. **Gestión de Pedidos**: Se registrará información detallada sobre cada pedido realizado, incluyendo el usuario que realizó el pedido, el estado del pedido, los productos seleccionados y la fecha de compra. Esto permitirá un seguimiento preciso del estado de cada pedido y facilitará la atención al cliente.

5. **Direcciones de Envío y Métodos de Pago**: Se permitirá a los usuarios almacenar múltiples direcciones de envío y métodos de pago en sus perfiles. Esto facilitará el proceso de compra al permitir a los clientes seleccionar rápidamente la dirección de envío y el método de pago preferidos durante el proceso de compra.

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

## Observaciones

- Cada tabla se ha diseñado siguiendo las buenas prácticas de modelado de bases de datos, garantizando la integridad de los datos y la eficiencia en el acceso.
- Se han establecido relaciones entre las tablas utilizando claves primarias y foráneas para mantener la coherencia de los datos.
- La estructura de la base de datos permite un seguimiento detallado de los pedidos, la gestión de usuarios y la administración del inventario.
