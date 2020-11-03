/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE status(
	id_status NUMBER(8),
    description VARCHAR2(30) CONSTRAINT status_description_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE status
IS 'Repository to storage information about clock`s status (selled, etc).';

/

COMMENT ON Column status.id_status
IS 'Status identification code.';

/

COMMENT ON Column status.description
IS 'Status category description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE status
ADD CONSTRAINT pk_status PRIMARY KEY (id_status)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE status
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_status
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertStatus
BEFORE INSERT
ON cl.status
FOR EACH ROW
BEGIN
	:new.id_status := s_status.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertStatus; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEStatus
BEFORE UPDATE
ON cl.status
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEStatus; 