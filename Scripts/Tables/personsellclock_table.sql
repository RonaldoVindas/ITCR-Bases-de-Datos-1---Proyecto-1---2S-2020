/*==================================================CREACIÓN DE TABLAS======================================================*/
CREATE TABLE personsellclock(
    id_person NUMBER(5),
    id_clock NUMBER(20)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE personsellclock
IS 'Repository to storage information about diferent wishlist.';

/

COMMENT ON Column personsellclock.id_person
IS 'Seller identification code.';

/

COMMENT ON Column personsellclock.id_clock
IS 'Clock indentification code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE personsellclock
ADD CONSTRAINT pk_personsellclock PRIMARY KEY (id_person, id_clock)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE personsellclock
ADD CONSTRAINT fk_personsellclock_person FOREIGN KEY
(id_person) REFERENCES person(id_person);


ALTER TABLE personsellclock
ADD CONSTRAINT fk_personsellclock_clock FOREIGN KEY
(id_clock) REFERENCES clock(id_clock);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE personsellclock
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertpersonsellclock
BEFORE INSERT
ON cl.personsellclock
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpersonsellclock; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpersonsellclock
BEFORE UPDATE
ON cl.personsellclock
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonsellclock; 