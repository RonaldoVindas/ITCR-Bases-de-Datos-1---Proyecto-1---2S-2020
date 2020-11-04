CREATE TABLE pay_method(
    id_pay_method NUMBER(5),
    pay_method_type VARCHAR2(50) CONSTRAINT pay_method_type_not_null NOT NULL
);


ALTER TABLE pay_method
ADD CONSTRAINT pk_pay_method PRIMARY KEY (id_pay_method)
USING INDEX 
TABLESPACE cl_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE pay_method
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

CREATE SEQUENCE s_pay_method
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;
/

CREATE OR REPLACE TRIGGER cl.beforeInsertpay_method
BEFORE INSERT
ON cl.pay_method
FOR EACH ROW
BEGIN
	:new.id_pay_method := s_pay_method.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpay_method; 

/

CREATE OR REPLACE TRIGGER cl.beforeUPDATEpay_method
BEFORE UPDATE
ON cl.pay_method
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpay_method; 
