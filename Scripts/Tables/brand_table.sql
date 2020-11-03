/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE brand(
    id_brand NUMBER(8),
    name VARCHAR (15) CONSTRAINT brand_name_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE brand
IS 'Repository to storage informaation about clock`s brand.';

COMMENT ON Column brand.id_brand
IS 'Brand identification code.';

COMMENT ON Column brand.name
IS 'Brand name.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE brand
ADD CONSTRAINT pk_brand PRIMARY KEY (id_brand)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

ALTER TABLE brand
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_brand
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/


CREATE OR REPLACE TRIGGER cl.beforeInsertbrand
BEFORE INSERT
ON cl.brand
FOR EACH ROW
BEGIN
	:new.id_brand := s_brand.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertbrand; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEbrand
BEFORE UPDATE
ON cl.brand
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEbrand; 
