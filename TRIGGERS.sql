--------------------------------------------------------
--  DDL for Trigger SET_OCCUPIED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##WSHOPR"."SET_OCCUPIED" 
AFTER UPDATE OF LOCATION_ID ON PRODUCT_STORAGE
BEGIN
UPDATE LOCATIONS_IN_WAREHOUSE  LIN
SET lin.occupied = 1
WHERE EXISTS (SELECT ps.location_id FROM product_storage ps WHERE ps.location_id = lin.location_id);
END;
/
ALTER TRIGGER "C##WSHOPR"."SET_OCCUPIED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SET_OCCUPIED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "C##WSHOPR"."SET_OCCUPIED" 
AFTER UPDATE OF LOCATION_ID ON PRODUCT_STORAGE
BEGIN
UPDATE LOCATIONS_IN_WAREHOUSE  LIN
SET lin.occupied = 1
WHERE EXISTS (SELECT ps.location_id FROM product_storage ps WHERE ps.location_id = lin.location_id);
END;
/
ALTER TRIGGER "C##WSHOPR"."SET_OCCUPIED" ENABLE;
