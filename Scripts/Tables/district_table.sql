CREATE TABLE district(
    id_district NUMBER(5),
    district_name VARCHAR2(50) CONSTRAINT district_name_not_null NOT NULL,
    id_canton NUMBER(5)
);


ALTER TABLE district
ADD CONSTRAINT pk_district PRIMARY KEY (id_district)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE district
ADD CONSTRAINT fk_district_canton FOREIGN KEY
(id_canton) REFERENCES canton(id_canton);


ALTER TABLE district
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_district
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertdistrict
BEFORE INSERT
ON cl.district
FOR EACH ROW
BEGIN
	:new.id_district := s_district.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertdistrict; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEdistrict
BEFORE UPDATE
ON cl.district
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEdistrict; 
