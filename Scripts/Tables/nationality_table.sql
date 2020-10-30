CREATE TABLE nationality(
    id_nationality NUMBER(5),
    nationality_name VARCHAR2(50) CONSTRAINT nationality_name_not_null NOT NULL
);


ALTER TABLE nationality
ADD CONSTRAINT pk_nationality PRIMARY KEY (id_nationality)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE nationality
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);
