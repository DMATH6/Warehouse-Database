--------------------------------------------------------
--  DDL for Function FNC_CHECK_STOCK
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "C##WSHOPR"."FNC_CHECK_STOCK" 
   ( p_product_id IN number,
    p_order_id IN number,
    p_order_qty IN number,
    v_stock_total OUT number) 
   RETURN number
AS



BEGIN

SELECT sum(product_qty)  INTO v_stock_total FROM product_storage  GROUP BY product_id HAVING product_id = p_product_id ;
 IF  v_stock_total < p_order_qty
 THEN
INSERT INTO order_items (product_id, order_id, order_qty)
VALUES(p_product_id, p_order_id, p_order_qty);

ELSE dbms_output.put_line('FAILED');
END IF;
END;

--HOWTO, fnc_check_stock('product id', 'order id', 'how much ordered')

/
