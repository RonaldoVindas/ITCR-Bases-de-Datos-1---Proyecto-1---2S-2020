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




