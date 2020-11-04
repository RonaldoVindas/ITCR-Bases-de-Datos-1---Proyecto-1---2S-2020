/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE category(
    id_category NUMBER(8),
    description VARCHAR2(30) CONSTRAINT category_decription_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE category
IS 'Repository to storage informaation about clock`s category.';

/

COMMENT ON Column category.id_category
IS 'Category identification code.';

/

COMMENT ON Column category.description
IS 'Clock category description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE category
ADD CONSTRAINT pk_category PRIMARY KEY (id_category)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE category
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_category
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertCategory
BEFORE INSERT
ON cl.category
FOR EACH ROW
BEGIN
	:new.id_category := s_category.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertCategory; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEcategory
BEFORE UPDATE
ON cl.category
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcategory; 