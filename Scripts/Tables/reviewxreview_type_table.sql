/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE reviewxreview_type(
    id_review NUMBER(5),
    id_review_type NUMBER(5)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE reviewxreview_type
IS 'Repository to storage information about diferent review types (as a User or as a seller).';

/

COMMENT ON Column reviewxreview_type.id_review
IS 'Review identification code.';

/

COMMENT ON Column reviewxreview_type.id_review_type
IS 'Review type identification code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/


ALTER TABLE reviewxreview_type
ADD CONSTRAINT pk_reviewxreview_type PRIMARY KEY (id_review, id_review_type)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE reviewxreview_type
ADD CONSTRAINT fk_reviewxreview_type_review FOREIGN KEY
(id_review) REFERENCES review(id_review);

ALTER TABLE reviewxreview_type
ADD CONSTRAINT fk_reviewxreview_type_rt FOREIGN KEY
(id_review_type) REFERENCES review_type(id_review_type);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE reviewxreview_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertreviewxreview_type
BEFORE INSERT
ON cl.reviewxreview_type
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertreviewxreview_type; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEreviewxreview_type
BEFORE UPDATE
ON cl.reviewxreview_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEreviewxreview_type; 