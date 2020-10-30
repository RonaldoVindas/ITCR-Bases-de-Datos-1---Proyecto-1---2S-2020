CREATE TABLE reviewxreview_type(
    id_review NUMBER(5),
    id_review_type NUMBER(5)
);


ALTER TABLE reviewxreview_type
ADD CONSTRAINT pk_reviewxreview_type PRIMARY KEY (id_review, id_review_type)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE reviewxreview_type
ADD CONSTRAINT fk_reviewxreview_type_review FOREIGN KEY
(id_review) REFERENCES review(id_review);

ALTER TABLE reviewxreview_type
ADD CONSTRAINT fk_reviewxreview_type_rt FOREIGN KEY
(id_review_type) REFERENCES review_type(id_review_type);


ALTER TABLE reviewxreview_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);