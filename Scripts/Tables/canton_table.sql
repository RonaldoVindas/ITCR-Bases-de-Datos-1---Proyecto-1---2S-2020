/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE canton(
    id_canton NUMBER(5),
    canton_name VARCHAR2(50) CONSTRAINT canton_name_not_null NOT NULL,
    id_province NUMBER(5)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE canton
IS 'Repository to storage information about cantons.';

/

COMMENT ON Column canton.id_canton
IS 'Canton identification code.';

/

COMMENT ON Column canton.canton_name
IS 'Canton name.';

/

COMMENT ON Column canton.id_province
IS 'Province identification code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/


ALTER TABLE canton
ADD CONSTRAINT pk_canton PRIMARY KEY (id_canton)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/
ALTER TABLE canton
ADD CONSTRAINT fk_canton_province FOREIGN KEY
(id_province) REFERENCES province(id_province);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE canton
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/
CREATE SEQUENCE s_canton
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertcanton
BEFORE INSERT
ON cl.canton
FOR EACH ROW
BEGIN
	:new.id_canton := s_canton.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcanton; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEcanton
BEFORE UPDATE
ON cl.canton
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcanton; 