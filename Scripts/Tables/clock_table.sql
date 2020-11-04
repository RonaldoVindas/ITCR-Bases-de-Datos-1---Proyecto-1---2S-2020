/*En esquema CL ===============================================================*/

/*==================================================CREACIÓN DE TABLAS======================================================*/

CREATE TABLE clock(
    id_clock NUMBER(8),
    name VARCHAR2(30) CONSTRAINT clock_name_notnull NOT NULL,
    model VARCHAR2(30) CONSTRAINT clock_model_notnull NOT NULL,
    description VARCHAR(50) CONSTRAINT clock_description_notnull NOT NULL,
    manifacturing_date DATE,
    price NUMBER(6),

    /*FK Columns*/

    id_binnacle NUMBER(8),
    id_shipping_type NUMBER(8),
    id_category NUMBER(8),
    id_brand NUMBER(8),
    id_status NUMBER(8),
    id_condition NUMBER(3),
    id_photo NUMBER(8)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

COMMENT ON TABLE clock
IS 'Repository to storage informaation about clocks.';

/

COMMENT ON Column clock.id_clock
IS 'Clock identification code.';

/

COMMENT ON Column clock.name
IS 'Clock´s name.';

/

COMMENT ON Column clock.model
IS 'Clock´s model.';

/

COMMENT ON Column clock.description
IS 'Clock category description.';

/

COMMENT ON Column clock.manifacturing_date
IS 'Clock´s manifacturing date.';

/

COMMENT ON Column clock.price
IS 'Clock´s price.';

/

COMMENT ON Column clock.id_binnacle
IS 'Clock´s binnacle identification.';

/


COMMENT ON Column clock.id_shipping_type
IS 'Clock´s shipping type identification.';

/

COMMENT ON Column clock.id_category
IS 'Clock´s category identification.';

/

COMMENT ON Column clock.id_brand
IS 'Clock´s brand identification.';

/

COMMENT ON Column clock.id_status
IS 'Clock´s status identification.';

/
COMMENT ON Column clock.id_condition
IS 'Clock´s condition identification.';

/
COMMENT ON Column clock.id_photo
IS 'Clock´s photo identification.';

/
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

ALTER TABLE clock
ADD CONSTRAINT pk_clock PRIMARY KEY (id_clock)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);



/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_binnacle FOREIGN KEY
(id_binnacle) REFERENCES binnacle(id_binnacle);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_shipping_type FOREIGN KEY
(id_shipping_type) REFERENCES shipping_type(id_shipping_type);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_category FOREIGN KEY
(id_category) REFERENCES category(id_category);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_brand FOREIGN KEY
(id_brand) REFERENCES brand(id_brand);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_status FOREIGN KEY
(id_status) REFERENCES status(id_status);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_condition FOREIGN KEY
(id_condition) REFERENCES condition(id_condition);

ALTER TABLE clock
ADD CONSTRAINT fk_clock_id_photo FOREIGN KEY
(id_photo) REFERENCES photo(id_photo);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/

ALTER TABLE clock
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA TABLAS======================================================*/

CREATE SEQUENCE s_clock
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER cl.beforeInsertclock
BEFORE INSERT
ON cl.clock
FOR EACH ROW
BEGIN
	:new.id_clock := s_clock.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertclock; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEclock
BEFORE UPDATE
ON cl.clock
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEclock; 