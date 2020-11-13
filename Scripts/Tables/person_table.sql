/*Sin querer perdí el script original en la transición del guardado local a la carpeta del repositorio,
este script fue generado automáticamente por el sql developer y es equivalente al script original.*/


--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "CL"."PERSON" 
   (    "ID_PERSON" NUMBER(5,0), 
    "FIRST_NAME" VARCHAR2(50 BYTE), 
    "LAST_NAME" VARCHAR2(50 BYTE), 
    "BIRTHDAY" DATE, 
    "EMAIL" VARCHAR2(50 BYTE), 
    "USERNAME" VARCHAR2(50 BYTE), 
    "USER_PASSWORD" VARCHAR2(30 BYTE), 
    "ID_GENDER" NUMBER(5,0), 
    "ID_NATIONALITY" NUMBER(5,0), 
    "ID_TYPE_PERSON" NUMBER(5,0), 
    "ID_PHOTO" NUMBER(5,0), 
    "ID_DISTRICT" NUMBER(5,0), 
    "CREATION_DATE" DATE, 
    "CREATION_USER" VARCHAR2(10 BYTE), 
    "DATE_LAST_MODIFICATION" DATE, 
    "USER_LAST_MODIFICATION" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "CL_DATA" ;
 

   COMMENT ON COLUMN "CL"."PERSON"."ID_PERSON" IS 'Person identification code.';
 
   COMMENT ON COLUMN "CL"."PERSON"."FIRST_NAME" IS 'Person first name.';
 
   COMMENT ON COLUMN "CL"."PERSON"."LAST_NAME" IS 'Person first name.';
 
   COMMENT ON COLUMN "CL"."PERSON"."EMAIL" IS 'Person email.';
 
   COMMENT ON COLUMN "CL"."PERSON"."USERNAME" IS 'Person username.';
 
   COMMENT ON COLUMN "CL"."PERSON"."USER_PASSWORD" IS 'Person account pasword.';
 
   COMMENT ON COLUMN "CL"."PERSON"."ID_GENDER" IS 'Person gender identification.';
 
   COMMENT ON COLUMN "CL"."PERSON"."ID_NATIONALITY" IS 'Person nationality identification.';
 
   COMMENT ON COLUMN "CL"."PERSON"."ID_TYPE_PERSON" IS 'Person role identification.';
 
   COMMENT ON COLUMN "CL"."PERSON"."ID_PHOTO" IS 'Person photo identification.';
 
   COMMENT ON COLUMN "CL"."PERSON"."ID_DISTRICT" IS 'Person district identification.';
 
   COMMENT ON TABLE "CL"."PERSON"  IS 'Repository to storage information about persons i the database.';
--------------------------------------------------------
--  DDL for Index PERSON_EMAIL_UNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "CL"."PERSON_EMAIL_UNIQUE" ON "CL"."PERSON" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "CL_DATA" ;
--------------------------------------------------------
--  DDL for Index PERSON_USERNAME_UNIQUE
--------------------------------------------------------

  CREATE UNIQUE INDEX "CL"."PERSON_USERNAME_UNIQUE" ON "CL"."PERSON" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "CL_DATA" ;
--------------------------------------------------------
--  DDL for Index PK_PERSON
--------------------------------------------------------

  CREATE UNIQUE INDEX "CL"."PK_PERSON" ON "CL"."PERSON" ("ID_PERSON") 
  PCTFREE 20 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 16384 NEXT 16384
  PCTINCREASE 0)
  TABLESPACE "CL_IND" ;
--------------------------------------------------------
--  DDL for Trigger BEFOREINSERTPERSON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CL"."BEFOREINSERTPERSON" 
BEFORE INSERT
ON cl.person
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertperson; 


/
ALTER TRIGGER "CL"."BEFOREINSERTPERSON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BEFOREUPDATEPERSON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CL"."BEFOREUPDATEPERSON" 
BEFORE UPDATE
ON cl.person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson; 
/
ALTER TRIGGER "CL"."BEFOREUPDATEPERSON" ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSON
--------------------------------------------------------

  ALTER TABLE "CL"."PERSON" MODIFY ("FIRST_NAME" CONSTRAINT "FIRST_NAME_NOT_NULL" NOT NULL ENABLE);
 
  ALTER TABLE "CL"."PERSON" MODIFY ("LAST_NAME" CONSTRAINT "LAST_NAME_NOT_NULL" NOT NULL ENABLE);
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "PERSON_EMAIL_UNIQUE" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "CL_DATA"  ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "PERSON_USERNAME_UNIQUE" UNIQUE ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "CL_DATA"  ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "PK_PERSON" PRIMARY KEY ("ID_PERSON")
  USING INDEX PCTFREE 20 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 16384 NEXT 16384
  PCTINCREASE 0)
  TABLESPACE "CL_IND"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSON
--------------------------------------------------------

  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "FK_PERSON_DISTRICT" FOREIGN KEY ("ID_DISTRICT")
      REFERENCES "CL"."DISTRICT" ("ID_DISTRICT") ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "FK_PERSON_GENDER" FOREIGN KEY ("ID_GENDER")
      REFERENCES "CL"."GENDER" ("ID_GENDER") ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "FK_PERSON_NATIONALITY" FOREIGN KEY ("ID_NATIONALITY")
      REFERENCES "CL"."NATIONALITY" ("ID_NATIONALITY") ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "FK_PERSON_PHOTO" FOREIGN KEY ("ID_PHOTO")
      REFERENCES "CL"."PHOTO" ("ID_PHOTO") ENABLE;
 
  ALTER TABLE "CL"."PERSON" ADD CONSTRAINT "FK_PERSON_TYPE_PERSON" FOREIGN KEY ("ID_TYPE_PERSON")
      REFERENCES "CL"."TYPE_PERSON" ("ID_TYPE_PERSON") ENABLE;