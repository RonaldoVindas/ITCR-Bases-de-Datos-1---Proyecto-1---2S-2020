/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE binnacle(
    id_binnacle NUMBER(8),
    last_price VARCHAR2(30),
    last_clock_owner VARCHAR2(30)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE binnacle
IS 'Repository to storage informaation about clock`s binnacle.';

/

COMMENT ON Column binnacle.id_binnacle
IS 'Clock binnacle identification code.';

/

COMMENT ON Column binnacle.last_price
IS 'Clock´s last price.';

/

COMMENT ON Column binnacle.last_clock_owner
IS 'Clock´s last owner.';



/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE binnacle
ADD CONSTRAINT pk_binnacle PRIMARY KEY (id_binnacle)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE binnacle
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_binnacle
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertbinnacle
BEFORE INSERT
ON cl.binnacle
FOR EACH ROW
BEGIN
	:new.id_binnacle := s_binnacle.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertCategory; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEbinnacle
BEFORE UPDATE
ON cl.binnacle
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEbinnacle; 