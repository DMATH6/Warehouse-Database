--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_FK" FOREIGN KEY ("COURIER_ID")
	  REFERENCES "C##WSHOPR"."COURIERS" ("COURIER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."ORDERS" ADD FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "C##WSHOPR"."CUSTOMERS" ("CUSTOMER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_ITEMS
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."ORDER_ITEMS" ADD CONSTRAINT "ORDRITMS_PRODUCT_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "C##WSHOPR"."PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "C##WSHOPR"."ORDER_ITEMS" ADD CONSTRAINT "ORDRITMS_ORDERS_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "C##WSHOPR"."ORDERS" ("ORDER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTS
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."PRODUCTS" ADD CONSTRAINT "SUPPLIER_ID_FK" FOREIGN KEY ("SUPPLIER_ID")
	  REFERENCES "C##WSHOPR"."SUPPLIERS" ("SUPPLIER_ID") ENABLE;
  ALTER TABLE "C##WSHOPR"."PRODUCTS" ADD CONSTRAINT "PRODUCT_IMAGES_FK" FOREIGN KEY ("PRODUCT_IMG_ID")
	  REFERENCES "C##WSHOPR"."PRODUCT_IMAGES" ("PRODUCT_IMG_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_DATES
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."PRODUCT_DATES" ADD CONSTRAINT "PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "C##WSHOPR"."PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "C##WSHOPR"."PRODUCT_DATES" ADD CONSTRAINT "LOCATION_ID_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "C##WSHOPR"."LOCATIONS_IN_WAREHOUSE" ("LOCATION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_STORAGE
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."PRODUCT_STORAGE" ADD CONSTRAINT "PRODUCT_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES "C##WSHOPR"."PRODUCTS" ("PRODUCT_ID") ENABLE;
  ALTER TABLE "C##WSHOPR"."PRODUCT_STORAGE" ADD CONSTRAINT "LOCATION_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "C##WSHOPR"."LOCATIONS_IN_WAREHOUSE" ("LOCATION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUPPLIERS
--------------------------------------------------------

  ALTER TABLE "C##WSHOPR"."SUPPLIERS" ADD CONSTRAINT "COURIER_FK" FOREIGN KEY ("COURIER_ID")
	  REFERENCES "C##WSHOPR"."COURIERS" ("COURIER_ID") ENABLE;
