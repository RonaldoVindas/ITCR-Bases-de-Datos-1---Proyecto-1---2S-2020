CREATE TABLE review_type(
    id_review_type NUMBER(5),
    review_type_name VARCHAR2(50) CONSTRAINT review_type_name_not_null NOT NULL
);


ALTER TABLE review_type
ADD CONSTRAINT pk_review_type PRIMARY KEY (id_review_type)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE review_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE SEQUENCE s_review_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertreviewtype
BEFORE INSERT
ON cl.review_type
FOR EACH ROW
BEGIN
	:new.id_review_type := s_review_type.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertreviewtype; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEreviewtype
BEFORE UPDATE
ON cl.review_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEreviewtype; 