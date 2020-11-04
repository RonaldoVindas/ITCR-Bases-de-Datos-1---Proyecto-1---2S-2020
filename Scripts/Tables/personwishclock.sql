CREATE TABLE personwishclock(
    id_person NUMBER(5),
    id_clock NUMBER(20)
);


ALTER TABLE personwishclock
ADD CONSTRAINT pk_personwishclock PRIMARY KEY (id_person, id_clock)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personwishclock
ADD CONSTRAINT fk_personwishclock_person FOREIGN KEY
(id_person) REFERENCES person(id_person);


/*
ALTER TABLE personwishclock
ADD CONSTRAINT fk_personwishclock_clock FOREIGN KEY
(id_clock) REFERENCES clock(id_clock);
*/


ALTER TABLE personwishclock
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE OR REPLACE TRIGGER cl.beforeInsertpwc
BEFORE INSERT
ON cl.personwishclock
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpwc; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpwc
BEFORE UPDATE
ON cl.personwishclock
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpwc; 