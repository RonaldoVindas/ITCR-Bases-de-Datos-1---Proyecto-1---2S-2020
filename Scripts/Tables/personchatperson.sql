CREATE TABLE personchatperson(
    id_person1 NUMBER(5),
    id_person2 NUMBER(5),
    message VARCHAR2(150),
    message_date DATE
);


ALTER TABLE personchatperson
ADD CONSTRAINT pk_personchatperson PRIMARY KEY (id_person1, id_person2)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personchatperson
ADD CONSTRAINT fk_personchatperson_person1 FOREIGN KEY
(id_person1) REFERENCES person(id_person);

ALTER TABLE personchatperson
ADD CONSTRAINT fk_personchatperson_person2 FOREIGN KEY
(id_person2) REFERENCES person(id_person);


ALTER TABLE personchatperson
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);



CREATE OR REPLACE TRIGGER cl.beforeInsertpcp
BEFORE INSERT
ON cl.personchatperson
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpcp; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpcp
BEFORE UPDATE
ON cl.personchatperson
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpcp; 