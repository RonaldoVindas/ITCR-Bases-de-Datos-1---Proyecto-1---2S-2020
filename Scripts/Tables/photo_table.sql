/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE photo(
    id_photo NUMBER(8),
    name  VARCHAR(15),
    photo_info VARCHAR2(30) CONSTRAINT photo_decription_notnull NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE photo
IS 'Repository to storage information about items and users photos.';

/

COMMENT ON Column photo.id_photo
IS 'Photo identification code.';

/

COMMENT ON Column photo.name
IS 'Photo´s name.';

/

COMMENT ON Column photo.photo_info
IS 'Photo description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE photo
ADD CONSTRAINT pk_photo PRIMARY KEY (id_photo)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE photo
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_photo
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertphoto
BEFORE INSERT
ON cl.photo
FOR EACH ROW
BEGIN
	:new.id_photo := s_photo.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertphoto; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEphoto
BEFORE UPDATE
ON cl.photo
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEphoto; 