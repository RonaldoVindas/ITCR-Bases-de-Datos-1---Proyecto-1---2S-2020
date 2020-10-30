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