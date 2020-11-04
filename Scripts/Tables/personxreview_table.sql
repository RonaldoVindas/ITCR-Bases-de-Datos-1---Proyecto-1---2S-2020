CREATE TABLE personxreview(
    id_person NUMBER(5),
    user_comment VARCHAR2(50),
    id_review NUMBER(5)
);


ALTER TABLE personxreview
ADD CONSTRAINT pk_personxreview PRIMARY KEY (id_person, id_review)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personxreview
ADD CONSTRAINT fk_personxreview_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personxreview
ADD CONSTRAINT fk_personxreview_review FOREIGN KEY
(id_review) REFERENCES review(id_review);



ALTER TABLE personxreview
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


CREATE OR REPLACE TRIGGER cl.beforeInsertpxr
BEFORE INSERT
ON cl.personxreview
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpxr; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpxr
BEFORE UPDATE
ON cl.personxreview
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpxr; 