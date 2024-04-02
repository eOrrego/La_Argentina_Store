# Proyecto Ecommerce La Argentina

## Temática del Proyecto

El proyecto consiste en el desarrollo de un sistema de comercio electrónico para "La Argentina", una tienda de ropa especializada en modelos exclusivos para hombres y mujeres. Este sistema ofrece una plataforma en línea que permite a los clientes explorar y adquirir productos únicos fabricados por la marca.

El sistema cuenta con un sistema de gestión de usuarios que incluye roles como administradores, publicadores y clientes, garantizando un control seguro y eficiente del acceso a la plataforma. Además, se incorpora un robusto control de sesiones y un historial de acceso para mejorar la seguridad y el seguimiento de la actividad del usuario.

La gestión de inventario se optimiza mediante el seguimiento del stock por depósitos, asegurando la disponibilidad de productos en todo momento. Los clientes pueden realizar compras de forma segura y modificar sus perfiles según sea necesario. Además, se permite a los usuarios almacenar múltiples direcciones de envío y métodos de pago para facilitar las transacciones.

## Detalle de Base de Datos y Tablas

### Usuario

- user_id (PK): Identificador único del usuario.
- full_name: Nombre completo del usuario.
- email: Correo electrónico del usuario.
- password: Contraseña del usuario.

### Rol

- role_id (PK): Identificador único del rol.
- role_name: Nombre del rol.

### UserRole

- user_id (FK, PK): Clave foránea que referencia el user_id en la tabla Usuario.
- role_id (FK, PK): Clave foránea que referencia el role_id en la tabla Rol.

### Pedido

- order_detail_id (PK): Identificador único del pedido.
- user_id (FK): Clave foránea que referencia el user_id en la tabla Usuario.
- state_id (FK): Clave foránea que referencia el state_id en la tabla Estado.
- order_date: Fecha en que se realizó el pedido.

### Producto

- product_id (PK): Identificador único del producto.
- product_name: Nombre del producto.
- description: Descripción del producto.
- price: Precio del producto.
- stock: Cantidad disponible en stock.

### PedidoProducto

- order_detail_id (FK, PK): Clave foránea que referencia el order_detail_id en la tabla Pedido.
- product_id (FK, PK): Clave foránea que referencia el product_id en la tabla Producto.

### Estado

- state_id (PK): Identificador único del estado.
- state_name: Nombre del estado.
- description: Descripción del estado.

### Sesión

- session_id (PK): Identificador único de la sesión.
- user_id (FK): Clave foránea que referencia el user_id en la tabla Usuario.
- start_date: Fecha y hora de inicio de la sesión.
- end_date: Fecha y hora de finalización de la sesión.

### HistorialAcceso

- history_id (PK): Identificador único del registro de acceso.
- user_id (FK): Clave foránea que referencia el user_id en la tabla Usuario.
- access_date: Fecha y hora del acceso.
- action: Descripción de la acción realizada por el usuario.

### DirecciónEnvío

- address_id (PK): Identificador único de la dirección de envío.
- user_id (FK): Clave foránea que referencia el user_id en la tabla Usuario.
- address: Dirección de envío.
- city: Ciudad de envío.
- postal_code: Código postal de envío.
- country: País de envío.

### MetodoPago

- method_id (PK): Identificador único del método de pago.
- user_id (FK): Clave foránea que referencia el user_id en la tabla Usuario.
- type: Tipo de método de pago (tarjeta de crédito, PayPal, etc.).
- number: Número de la tarjeta de crédito u otro identificador del método de pago.
- expiration_date: Fecha de vencimiento del método de pago.

### PedidoDireccion

- order_detail_id (FK, PK): Clave foránea que referencia el order_detail_id en la tabla Pedido.
- address_id (FK, PK): Clave foránea que referencia el address_id en la tabla DirecciónEnvío.

### PedidoMetodoPago

- order_detail_id (FK, PK): Clave foránea que referencia el order_detail_id en la tabla Pedido.
- method_id (FK, PK): Clave foránea que referencia el method_id en la tabla MetodoPago.
