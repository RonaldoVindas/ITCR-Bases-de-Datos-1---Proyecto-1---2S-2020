CREATE TABLE person(
    id_person NUMBER(5),
    first_name VARCHAR2(50) CONSTRAINT first_name_not_null NOT NULL,
    last_name VARCHAR2(50) CONSTRAINT last_name_not_null NOT NULL,
    birthday DATE,
    email VARCHAR2(50) CONSTRAINT person_email_unique UNIQUE,
    username VARCHAR2(50) CONSTRAINT person_username_unique UNIQUE,
    user_password VARCHAR2(30),
    id_gender NUMBER(5),
    id_nationality NUMBER(5),
    id_type_person NUMBER(5),
    id_photo NUMBER(5),
    id_district NUMBER(5)
);


ALTER TABLE person
ADD CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE person
ADD CONSTRAINT fk_person_gender FOREIGN KEY
(id_gender) REFERENCES gender(id_gender);

ALTER TABLE person
ADD CONSTRAINT fk_person_nationality FOREIGN KEY
(id_nationality) REFERENCES nationality(id_nationality);

ALTER TABLE person
ADD CONSTRAINT fk_person_type_person FOREIGN KEY
(id_type_person) REFERENCES type_person(id_type_person);

/*falta implementar este fk
ALTER TABLE person
ADD CONSTRAINT fk_person_photo FOREIGN KEY
(id_photo) REFERENCES photo(id_photo);
*/

ALTER TABLE person
ADD CONSTRAINT fk_person_district FOREIGN KEY
(id_district) REFERENCES district(id_district);


ALTER TABLE person
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertperson
BEFORE INSERT
ON cl.person
FOR EACH ROW
BEGIN
	:new.id_person := s_person.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertperson; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEperson
BEFORE UPDATE
ON cl.person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson; 
