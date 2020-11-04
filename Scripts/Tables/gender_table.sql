CREATE TABLE gender(
    id_gender NUMBER(5),
    gender_name VARCHAR2(50) CONSTRAINT gender_name_not_null NOT NULL
);


ALTER TABLE gender
ADD CONSTRAINT pk_gender PRIMARY KEY (id_gender)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE gender
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_gender
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertgender
BEFORE INSERT
ON cl.gender
FOR EACH ROW
BEGIN
	:new.id_gender := s_gender.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertgender; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEgender
BEFORE UPDATE
ON cl.gender
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEgender; 


