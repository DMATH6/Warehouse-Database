--------------------------------------------------------
--  DDL for View DISPLAY_CURRENT_ORDER
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##WSHOPR"."DISPLAY_CURRENT_ORDER" ("PRODUCT_ID", "Total Ordered", "CUSTOMER_NAME") AS 
  SELECT oi.product_id, sum(oi.order_qty)"Total Ordered", c.customer_name FROM order_items oi 
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_id = 2
GROUP BY oi.product_id, c.customer_name
;
--------------------------------------------------------
--  DDL for View DISPLAY_PRODUCT_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##WSHOPR"."DISPLAY_PRODUCT_INFORMATION" ("PRODUCT_NAME", "PRODUCT_ID", "Total Product In Warehouse") AS 
  SELECT p.product_name, ps.product_id, sum(ps.product_qty) AS "Total Product In Warehouse" FROM product_storage ps
LEFT JOIN products p ON p.product_id = ps.product_id
GROUP BY ps.product_id, p.product_name
ORDER BY ps.product_id
;
--------------------------------------------------------
--  DDL for View VIEW_AVAIABLE_LOCATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "C##WSHOPR"."VIEW_AVAIABLE_LOCATIONS" ("LOCATION_ID", "OCCUPIED", "PRODUCT_STORAGE_TYPE", "LOCATION_NAME") AS 
  SELECT "LOCATION_ID","OCCUPIED","PRODUCT_STORAGE_TYPE","LOCATION_NAME" 
FROM locations_in_warehouse
WHERE occupied = 0
;
