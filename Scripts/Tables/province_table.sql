CREATE TABLE province(
    id_province NUMBER(5),
    province_name VARCHAR2(50) CONSTRAINT province_name_not_null NOT NULL,
    id_country NUMBER(5)
);


ALTER TABLE province
ADD CONSTRAINT pk_province PRIMARY KEY (id_province)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE province
ADD CONSTRAINT fk_province_country FOREIGN KEY
(id_country) REFERENCES country(id_country);


ALTER TABLE province
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

CREATE SEQUENCE s_province
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertprovince
BEFORE INSERT
ON cl.province
FOR EACH ROW
BEGIN
	:new.id_province := s_province.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertprovince; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEprovince
BEFORE UPDATE
ON cl.province
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEprovince; 