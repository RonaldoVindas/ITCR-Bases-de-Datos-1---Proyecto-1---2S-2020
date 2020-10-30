CREATE TABLE personsellclock(
    id_person NUMBER(5),
    id_clock NUMBER(20)
);


ALTER TABLE personsellclock
ADD CONSTRAINT pk_personsellclock PRIMARY KEY (id_person, id_clock)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personsellclock
ADD CONSTRAINT fk_personsellclock_person FOREIGN KEY
(id_person) REFERENCES person(id_person);


/*
ALTER TABLE personsellclock
ADD CONSTRAINT fk_personsellclock_clock FOREIGN KEY
(id_clock) REFERENCES clock(id_clock);
*/


ALTER TABLE personsellclock
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);