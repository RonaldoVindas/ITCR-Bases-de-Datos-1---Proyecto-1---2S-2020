/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE review_type(
    id_review_type NUMBER(5),
    review_type_name VARCHAR2(50) CONSTRAINT review_type_name_not_null NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/
COMMENT ON TABLE review_type
IS 'Repository to storage informaation about types of review (as User or as a Seller).';

/

COMMENT ON Column review_type.id_review_type
IS 'Review type identification code.';

/

COMMENT ON Column review_type.review_type_name
IS 'Review type name.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE review_type
ADD CONSTRAINT pk_review_type PRIMARY KEY (id_review_type)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE review_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_review_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertreview_type
BEFORE INSERT
ON cl.review_type
FOR EACH ROW
BEGIN
	:new.id_review_type := s_review_type.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertreview_type; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEreview_type
BEFORE UPDATE
ON cl.review_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEreview_type; 
