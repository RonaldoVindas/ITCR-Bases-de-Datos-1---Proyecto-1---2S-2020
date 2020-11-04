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


CREATE SEQUENCE s_review
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertreview
BEFORE INSERT
ON cl.review
FOR EACH ROW
BEGIN
	:new.id_review := s_review.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertreview; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEreview
BEFORE UPDATE
ON cl.review
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEreview; 