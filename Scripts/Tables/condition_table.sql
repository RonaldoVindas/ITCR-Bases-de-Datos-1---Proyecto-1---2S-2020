/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE condition(
    id_condition NUMBER(3),
    description VARCHAR2(30) CONSTRAINT condition_decription_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE condition
IS 'Repository to storage informaation about clock`s condition.';

/

COMMENT ON Column condition.id_condition
IS 'Condition identification code.';

/

COMMENT ON Column condition.description
IS 'Clock condition description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE condition
ADD CONSTRAINT pk_condition PRIMARY KEY (id_condition)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE condition
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_condition
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertcondition
BEFORE INSERT
ON cl.condition
FOR EACH ROW
BEGIN
	:new.id_condition := s_condition.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcondition; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEcondition
BEFORE UPDATE
ON cl.condition
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcondition; 