/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE nationality(
    id_nationality NUMBER(5),
    nationality_name VARCHAR2(50) CONSTRAINT nationality_name_not_null NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE nationality
IS 'Repository to storage informaation about nationality.';

/

COMMENT ON Column nationality.id_nationality
IS 'Nationality identification code.';

/

COMMENT ON Column nationality.nationality_name
IS 'Nationality name.';


/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE nationality
ADD CONSTRAINT pk_nationality PRIMARY KEY (id_nationality)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE nationality
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_nationality
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertnationality
BEFORE INSERT
ON cl.nationality
FOR EACH ROW
BEGIN
	:new.id_nationality := s_nationality.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertnationality; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEnationality
BEFORE UPDATE
ON cl.nationality
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEnationality; 