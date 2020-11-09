create or replace package control_person_buy_clock is
PROCEDURE insert_person_buy_clock (pid_person IN NUMBER, pid_clock NUMBER,pid_pay_method NUMBER);
PROCEDURE remove_person_buy_clock (pid_person IN NUMBER);
PROCEDURE update_pbc_id_person(pid_person IN NUMBER, pnewid NUMBER);
PROCEDURE update_pbc_id_pay_method(pid_person IN NUMBER, pnewid NUMBER);
PROCEDURE update_pbc_id_clock(pid_clock IN NUMBER, pnewid NUMBER);
FUNCTION getpbcIdPerson(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getpbcIdPay_Method(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getpbcIdClock(pid_person IN NUMBER) RETURN NUMBER;
end control_person_buy_clock;
/
create or replace PACKAGE BODY control_person_buy_clock IS

PROCEDURE insert_person_buy_clock (pid_person IN NUMBER, pid_clock NUMBER,pid_pay_method NUMBER)AS
begin
    insert into person_buy_clock(id_person,id_clock,id_pay_method)
    values (pid_person,pid_clock,pid_pay_method);
    commit;
end insert_person_buy_clock;


PROCEDURE remove_person_buy_clock (pid_person IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from person_buy_clock
    where id_person= pid_person;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_exc;
    END IF;
    EXCEPTION
    WHEN e_invalid_exc THEN
        DBMS_OUTPUT.PUT_LINE('No such row.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_person_buy_clock;

PROCEDURE update_pbc_id_person(pid_person IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update person_buy_clock
    set id_person=pnewid
    where id_person=pid_person;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_exc;
    END IF;
    EXCEPTION
    WHEN e_invalid_exc THEN
        DBMS_OUTPUT.PUT_LINE('No such phone.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_pbc_id_person;

PROCEDURE update_pbc_id_pay_method(pid_person IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update person_buy_clock
    set id_pay_method=pnewid
    where id_person=pid_person;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_exc;
    END IF;
    EXCEPTION
    WHEN e_invalid_exc THEN
        DBMS_OUTPUT.PUT_LINE('No such row.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_pbc_id_pay_method;

PROCEDURE update_pbc_id_clock(pid_clock IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update person_buy_clock
    set id_clock=pnewid
    where id_clock=pid_clock;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_exc;
    END IF;
    EXCEPTION
    WHEN e_invalid_exc THEN
        DBMS_OUTPUT.PUT_LINE('No such row.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_pbc_id_clock;


FUNCTION getpbcIdPerson(pid_clock IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person
    into vcName
    from person_buy_clock
    where id_clock=pid_clock ;
    return (VCNAME);
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pId.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
END;

FUNCTION getpbcIdPay_Method(pid_person IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_pay_method
    into vcID
    from person_buy_clock
    where id_person=pid_person;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcanton.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;

FUNCTION getpbcIdClock(pid_person IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_clock
    into vcID
    from person_buy_clock
    where id_person=pid_person;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcanton.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_person_buy_clock;