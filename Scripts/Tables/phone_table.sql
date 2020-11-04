/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE phone(
    id_phone NUMBER(5),
    phone_number NUMBER(20) CONSTRAINT phone_number_not_null NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE phone
IS 'Repository to storage information about user´s phones.';

/

COMMENT ON Column phone.id_phone
IS 'Phone identification code.';

/

COMMENT ON Column phone.phone_number
IS 'Phone name.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE  phone
ADD CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE phone
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/
CREATE SEQUENCE s_phone
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertphone
BEFORE INSERT
ON cl.phone
FOR EACH ROW
BEGIN
	:new.id_phone := s_phone.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertphone; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEphone
BEFORE UPDATE
ON cl.phone
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEphone; 