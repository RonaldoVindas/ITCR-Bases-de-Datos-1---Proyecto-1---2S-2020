/*Person X Clock X Pay Method*/
/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE person_buy_clock(
    id_person NUMBER(5),
    id_clock NUMBER(8),
    id_pay_method NUMBER (5)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/
COMMENT ON TABLE person_buy_clock
IS 'Repository to storage information about associated phones to persons.';

/

COMMENT ON Column person_buy_clock.id_person
IS 'Person identification code.';

/

COMMENT ON Column person_buy_clock.id_clock
IS 'Clock identification code.';

/

COMMENT ON Column person_buy_clock.id_pay_method
IS 'Pay Method identification code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE person_buy_clock
ADD CONSTRAINT pk_person_buy_clock PRIMARY KEY (id_person, id_clock, id_pay_method)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE person_buy_clock
ADD CONSTRAINT fk_personbuyclock_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE person_buy_clock
ADD CONSTRAINT fk_personbuyclock_clock FOREIGN KEY
(id_clock) REFERENCES clock(id_clock);

ALTER TABLE person_buy_clock
ADD CONSTRAINT fk_personbuyclock_pay_method FOREIGN KEY
(id_pay_method) REFERENCES pay_method(id_pay_method);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE person_buy_clock
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertperson_buy_clock
BEFORE INSERT
ON cl.person_buy_clock
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertperson_buy_clock; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEperson_buy_clock
BEFORE UPDATE
ON cl.person_buy_clock
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson_buy_clock; 
