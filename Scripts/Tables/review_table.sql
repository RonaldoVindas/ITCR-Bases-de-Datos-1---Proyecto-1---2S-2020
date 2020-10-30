CREATE TABLE review(
    id_review NUMBER(5),
    stars NUMBER(5)
);


ALTER TABLE review
ADD CONSTRAINT pk_review PRIMARY KEY (id_review)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE review
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);
