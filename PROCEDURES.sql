--------------------------------------------------------
--  DDL for Procedure PCDR_CREATE_NEW_ORDER_ITEMS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##WSHOPR"."PCDR_CREATE_NEW_ORDER_ITEMS" 
    (
    p_product_id IN number,
    p_order_id IN number,
    p_order_qty IN number
    )
   


AS

v_stock_total number;





BEGIN

INSERT INTO order_items (product_id, order_id, order_qty)
VALUES (p_product_id, p_order_id, p_order_qty);
SELECT sum(ps.product_qty) INTO v_stock_total FROM product_storage ps 
WHERE ps.product_id = p_product_id
AND product_qty >=  p_order_qty
AND p_order_qty > 0

GROUP BY ps.product_id;
UPDATE
    product_storage
SET
    product_qty = product_qty - p_order_qty 
    WHERE product_id = p_product_id
    AND product_qty >=  p_order_qty;
    

END;

--HOWTO, pcdr_create_new_order_items('product id', 'order id', 'how much ordered')

/
--------------------------------------------------------
--  DDL for Procedure PCDR_CREATE_NEW_PRODUCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "C##WSHOPR"."PCDR_CREATE_NEW_PRODUCT" 
    (
   -- p_product_id IN number, don't need this 
    p_product_name IN VARCHAR2,
    p_product_desc IN VARCHAR2,
    p_product_storage_type IN VARCHAR2,
    p_supplier_id IN NUMBER,
    p_product_img_id IN NUMBER
    )
   


AS

v_product_id number;





BEGIN

INSERT INTO products (product_id, product_name, product_desc, product_storage_type, supplier_id, product_img_id)
SELECT max(product_id)+1, p_product_name, p_product_desc, p_product_storage_type, p_supplier_id, p_product_img_id FROM products
    WHERE
        p_product_name IS NOT NULL
    AND p_product_desc IS NOT NULL
    AND p_product_storage_type IS NOT NULL
    AND p_supplier_id IS NOT NULL;
END;

/
