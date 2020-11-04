/*==================================================CREACIÓN DE TABLAS======================================================*/
CREATE TABLE type_person(
    id_type_person NUMBER(5),
    type_person_name VARCHAR2(50) CONSTRAINT type_person_name_not_null NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE type_person
IS 'Repository to storage informaation about person´s roles (Admin or User).';

/

COMMENT ON Column type_person.id_type_person
IS 'Type of role identification code.';

/

COMMENT ON Column type_person.type_person_name
IS 'Role name.';


/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE type_person
ADD CONSTRAINT pk_type_person PRIMARY KEY (id_type_person)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE type_person
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);
/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_type_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInserttype_person
BEFORE INSERT
ON cl.type_person
FOR EACH ROW
BEGIN
	:new.id_type_person := s_type_person.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInserttype_person; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEtype_person
BEFORE UPDATE
ON cl.type_person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEtype_person; 