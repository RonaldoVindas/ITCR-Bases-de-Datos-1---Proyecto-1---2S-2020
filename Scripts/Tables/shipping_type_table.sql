/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE shipping_type(
    id_shipping_type NUMBER(8),
    description VARCHAR2(30) CONSTRAINT shipping_decription_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE shipping_type
IS 'Repository to storage informaation about clock`s shipping type.';

/

COMMENT ON Column shipping_type.id_shipping_type
IS 'Shipping type identification code.';

/

COMMENT ON Column shipping_type.description
IS 'Clock´s shipping type description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE shipping_type
ADD CONSTRAINT pk_shipping_type PRIMARY KEY (id_shipping_type)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE shipping_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_shipping_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertshipping_type
BEFORE INSERT
ON cl.shipping_type
FOR EACH ROW
BEGIN
	:new.id_shipping_type := s_shipping_type.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertshipping_type; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEshipping_type
BEFORE UPDATE
ON cl.shipping_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEshipping_type; 