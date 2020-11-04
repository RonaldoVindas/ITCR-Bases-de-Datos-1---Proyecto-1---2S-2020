/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE personxphone(
    id_person NUMBER(5),
    id_phone NUMBER(20)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/
COMMENT ON TABLE personxphone
IS 'Repository to storage information about associated phones to persons.';

/

COMMENT ON Column personxphone.id_person
IS 'Person identification code.';

/

COMMENT ON Column personxphone.id_phone
IS 'Phone code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE personxphone
ADD CONSTRAINT pk_personxphone PRIMARY KEY (id_person, id_phone)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE personxphone
ADD CONSTRAINT fk_personxphone_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personxphone
ADD CONSTRAINT fk_personxphone_phone FOREIGN KEY
(id_phone) REFERENCES phone(id_phone);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE personxphone
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertpersonxphone
BEFORE INSERT
ON cl.personxphone
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpersonxphone; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpersonxphone
BEFORE UPDATE
ON cl.personxphone
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonxphone; 
