/*==================================================CREACIÓN DE TABLAS======================================================*/
CREATE TABLE country(
    id_country NUMBER(5),
    country_name VARCHAR2(50) CONSTRAINT country_name_not_null NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE country
IS 'Repository to storage information about countries.';

/

COMMENT ON Column country.id_country
IS 'Country identification code.';

/

COMMENT ON Column country.country_name
IS 'Country name.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/


ALTER TABLE country
ADD CONSTRAINT pk_country PRIMARY KEY (id_country)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE country
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_country
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertcountry
BEFORE INSERT
ON cl.country
FOR EACH ROW
BEGIN
	:new.id_country := s_country.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcountry; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEcountry
BEFORE UPDATE
ON cl.country
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcountry; 