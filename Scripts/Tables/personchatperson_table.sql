/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE personchatperson(
    id_person1 NUMBER(5),
    id_person2 NUMBER(5),
    message VARCHAR2(150),
    message_date DATE
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE personchatperson
IS 'Repository to storage information about chat between users.';

/

COMMENT ON Column personchatperson.id_person1
IS 'Transmitter person owner identification code.';

/

COMMENT ON Column personchatperson.id_person2
IS 'Receiver person indentification code.';

/

COMMENT ON Column personchatperson.message
IS 'Message Text.';

/

COMMENT ON Column personchatperson.message_date
IS 'Message date.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE personchatperson
ADD CONSTRAINT pk_personchatperson PRIMARY KEY (id_person1, id_person2)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE personchatperson
ADD CONSTRAINT fk_personchatperson_person1 FOREIGN KEY
(id_person1) REFERENCES person(id_person);

ALTER TABLE personchatperson
ADD CONSTRAINT fk_personchatperson_person2 FOREIGN KEY
(id_person2) REFERENCES person(id_person);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE personchatperson
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertpersonchatperson
BEFORE INSERT
ON cl.personchatperson
FOR EACH ROW
BEGIN
	:new.message_date := SYSDATE;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpersonchatperson; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpersonchatperson
BEFORE UPDATE
ON cl.personchatperson
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonchatperson; 
