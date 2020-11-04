CREATE TABLE country(
    id_country NUMBER(5),
    country_name VARCHAR2(50) CONSTRAINT country_name_not_null NOT NULL
);


ALTER TABLE country
ADD CONSTRAINT pk_country PRIMARY KEY (id_country)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE country
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_country
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertcountry
BEFORE INSERT
ON cl.country
FOR EACH ROW
BEGIN
	:new.id_country := s_country.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcountry; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEcountry
BEFORE UPDATE
ON cl.country
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcountry; 
