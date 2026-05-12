## Actua como un administrador de datos: proyecto amazon compras, que entidades se necesitan para su gestión

 Como administrador de datos del proyecto **Amazon Compras**, aquí están las entidades principales que necesitas para una gestión completa del sistema:Aquí el resumen de las **12 entidades** del modelo, agrupadas por dominio:

<img width="1440" height="776" alt="image" src="https://github.com/user-attachments/assets/8947529a-894d-40a1-958b-17c214dafe25" />

**Dominio del cliente**
- `CLIENTE` — datos maestros del comprador (nombre, email, estado de cuenta)
- `DIRECCION` — múltiples domicilios de entrega por cliente
- `METODO_PAGO` — tarjetas o medios de pago registrados

**Dominio del catálogo**
- `PRODUCTO` — ficha del artículo con precio y stock
- `CATEGORIA` — árbol jerárquico (padre_id permite subcategorías)
- `VENDEDOR` — el marketplace, con RFC y calificación

**Dominio del pedido**
- `PEDIDO` — cabecera de la orden (estado, total, dirección destino)
- `ITEM_PEDIDO` — líneas del pedido (cantidad, precio congelado al momento de compra)
- `PAGO` — transacción ligada al pedido y al método de pago
- `ENVIO` — guía de rastreo y estado de entrega

**Dominio logístico / calidad**
- `TRANSPORTISTA` — DHL, FedEx, Amazon Logistics, etc.
- `RESENA` — calificación y comentario del cliente sobre el producto

---

**Decisiones de diseño clave:**
- `precio_unitario` se guarda en `ITEM_PEDIDO` para preservar el precio histórico aunque el producto cambie de precio.
- `CATEGORIA` tiene `padre_id` para modelar la jerarquía (Electrónica → Smartphones → Android).
- El estado del `PEDIDO` y del `ENVIO` se manejan por separado porque un pedido puede tener múltiples envíos parciales.

## Las entidades con sus atributos y tipo en forma de tabla para cada una de las entidades

<img width="748" height="346" alt="image" src="https://github.com/user-attachments/assets/4e796c6b-975c-4704-b8f1-7d8e8e8a511b" />
<img width="745" height="415" alt="image" src="https://github.com/user-attachments/assets/1804a04c-5001-43b6-beb3-824c71f49e50" />
<img width="751" height="404" alt="image" src="https://github.com/user-attachments/assets/7ef2ed7a-d7c0-45d3-aef3-a3dd901cef86" />
<img width="749" height="474" alt="image" src="https://github.com/user-attachments/assets/7af27c52-2e5f-49af-839e-f01b85f45e83" />
<img width="767" height="295" alt="image" src="https://github.com/user-attachments/assets/aab6d5f4-8496-4438-964a-2829c957fa76" />
<img width="743" height="349" alt="image" src="https://github.com/user-attachments/assets/512b44cd-2d8e-474c-aa09-6a18816d54fc" />
<img width="746" height="575" alt="image" src="https://github.com/user-attachments/assets/e6d8697b-bd0d-41cf-a50f-8ac8353d6bd3" />
<img width="739" height="383" alt="image" src="https://github.com/user-attachments/assets/89c35a4f-880e-4180-8b21-70f2454b9c44" />
<img width="742" height="386" alt="image" src="https://github.com/user-attachments/assets/0368675d-664a-460b-922a-f97519bcd7c6" />
<img width="745" height="393" alt="image" src="https://github.com/user-attachments/assets/f07cde3a-77a4-4e91-b4dc-79e98c46b409" />
<img width="740" height="271" alt="image" src="https://github.com/user-attachments/assets/d403602d-1cff-4363-b66b-439d53f6f647" />
<img width="745" height="406" alt="image" src="https://github.com/user-attachments/assets/7ee9b099-95ce-479d-909e-a64ba278fa4a" />

PK Clave primaria
FK Clave foránea
No = campo obligatorio
Sí = campo opcional (nullable)

## De acuerdo a tu respuesta anterior puedes generar un script en sql para descargar con el nombre de bdamazon.sql para las 12 entidades con sus relaciones
