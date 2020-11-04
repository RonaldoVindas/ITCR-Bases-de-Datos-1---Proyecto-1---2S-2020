CREATE TABLE type_person(
    id_type_person NUMBER(5),
    type_person_name VARCHAR2(50) CONSTRAINT type_person_name_not_null NOT NULL
);


ALTER TABLE type_person
ADD CONSTRAINT pk_type_person PRIMARY KEY (id_type_person)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE type_person
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_type_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInserttypeperson
BEFORE INSERT
ON cl.type_person
FOR EACH ROW
BEGIN
	:new.id_type_person := s_type_person.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInserttypeperson; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEtypeperson
BEFORE UPDATE
ON cl.type_person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEtypeperson; 