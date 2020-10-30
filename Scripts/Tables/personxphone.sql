CREATE TABLE personxphone(
    id_person NUMBER(5),
    id_phone NUMBER(20)
);


ALTER TABLE personxphone
ADD CONSTRAINT pk_personxphone PRIMARY KEY (id_person, id_phone)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personxphone
ADD CONSTRAINT fk_personxphone_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personxphone
ADD CONSTRAINT fk_personxphone_phone FOREIGN KEY
(id_phone) REFERENCES phone(id_phone);



ALTER TABLE personxphone
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);