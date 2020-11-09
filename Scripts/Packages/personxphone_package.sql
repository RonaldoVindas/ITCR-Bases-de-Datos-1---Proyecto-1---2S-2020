create or replace package control_personxphone is
PROCEDURE insert_personxphone (pid_person IN NUMBER, pid_phone NUMBER);
PROCEDURE remove_personxphone (pid_person IN NUMBER);
PROCEDURE update_pxp_id_person(pid_person IN NUMBER, pnewid NUMBER);
PROCEDURE update_pxp_id_phone(pid_phone IN NUMBER, pnewid NUMBER);
FUNCTION getpersonxphoneIdPerson(pid_phone IN NUMBER) RETURN NUMBER;
FUNCTION getpersonxphoneIdPhone(pid_person IN NUMBER) RETURN NUMBER;
end control_personxphone;
/
create or replace PACKAGE BODY control_personxphone IS

PROCEDURE insert_personxphone (pid_person IN NUMBER, pid_phone NUMBER)AS
begin
    insert into personxphone(id_person,id_phone)
    values (pid_person,pid_phone);
    commit;
end insert_personxphone;


PROCEDURE remove_personxphone (pid_person IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from personxphone
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
end remove_personxphone;

PROCEDURE update_pxp_id_person(pid_person IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personxphone
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
end update_pxp_id_person;

PROCEDURE update_pxp_id_phone(pid_phone IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personxphone
    set id_phone=pnewid
    where id_phone=pid_phone;
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
end update_pxp_id_phone;


FUNCTION getpersonxphoneIdPerson(pid_phone IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person
    into vcName
    from personxphone
    where id_phone=pid_phone ;
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


FUNCTION getpersonxphoneIdPhone(pid_person IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_phone
    into vcID
    from personxphone
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
END control_personxphone;