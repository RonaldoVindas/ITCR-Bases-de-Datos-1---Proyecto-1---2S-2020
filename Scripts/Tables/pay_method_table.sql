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