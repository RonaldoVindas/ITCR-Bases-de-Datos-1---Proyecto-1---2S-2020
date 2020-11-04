CREATE TABLE phone(
    id_phone NUMBER(5),
    phone_number NUMBER(20) CONSTRAINT phone_number_not_null NOT NULL
);


ALTER TABLE  phone
ADD CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE phone
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

CREATE SEQUENCE s_phone
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

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