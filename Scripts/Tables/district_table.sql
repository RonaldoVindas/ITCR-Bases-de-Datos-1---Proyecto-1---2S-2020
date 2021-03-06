/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE district(
    id_district NUMBER(5),
    district_name VARCHAR2(50) CONSTRAINT district_name_not_null NOT NULL,
    id_canton NUMBER(5)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE district
IS 'Repository to storage information about districts.';

/

COMMENT ON Column district.id_district
IS 'District identification code.';

/

COMMENT ON Column district.district_name
IS 'District name.';

/

COMMENT ON Column district.id_canton
IS 'Canton identification code.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/


ALTER TABLE district
ADD CONSTRAINT pk_district PRIMARY KEY (id_district)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE district
ADD CONSTRAINT fk_district_canton FOREIGN KEY
(id_canton) REFERENCES canton(id_canton);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE district
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/
CREATE SEQUENCE s_district
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertdistrict
BEFORE INSERT
ON cl.district
FOR EACH ROW
BEGIN
	:new.id_district := s_district.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertdistrict; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEdistrict
BEFORE UPDATE
ON cl.district
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEdistrict; 