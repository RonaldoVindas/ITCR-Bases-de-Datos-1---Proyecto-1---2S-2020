/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE personxreview(
    id_person NUMBER(8),
    user_comment VARCHAR2(50),
    id_review NUMBER(8)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/
COMMENT ON TABLE personxreview
IS 'Repository to storage information about diferent wishlist.';

/

COMMENT ON Column personxreview.id_person
IS 'Person identification code.';

/

COMMENT ON Column personxreview.id_review
IS 'Review indentification code.';

/

COMMENT ON Column personxreview.user_comment
IS 'Review´s comment.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE personxreview
ADD CONSTRAINT pk_personxreview PRIMARY KEY (id_person, id_review)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE personxreview
ADD CONSTRAINT fk_personxreview_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personxreview
ADD CONSTRAINT fk_personxreview_review FOREIGN KEY
(id_review) REFERENCES review(id_review);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE personxreview
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertpersonxreview
BEFORE INSERT
ON cl.personxreview
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpersonxreview; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpersonxreview
BEFORE UPDATE
ON cl.personxreview
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonxreview; 