create or replace package control_personsellclock is
PROCEDURE insert_personsellclock (pid_person IN NUMBER, pid_clock NUMBER);
PROCEDURE remove_personsellclock (pid_person IN NUMBER);
PROCEDURE update_psc_id_person(pid_person IN NUMBER, pnewid NUMBER);
PROCEDURE update_psc_id_clock(pid_clock IN NUMBER, pnewid NUMBER);
FUNCTION getpersonsellclockIdPerson(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getpersonsellclockIdClock(pid_person IN NUMBER) RETURN NUMBER;
end control_personsellclock;
/
create or replace PACKAGE BODY control_personsellclock IS

PROCEDURE insert_personsellclock (pid_person IN NUMBER, pid_clock NUMBER)AS
begin
    insert into personsellclock(id_person,id_clock)
    values (pid_person,pid_clock);
    commit;
end insert_personsellclock;


PROCEDURE remove_personsellclock (pid_person IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from personsellclock
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
end remove_personsellclock;

PROCEDURE update_psc_id_person(pid_person IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personsellclock
    set id_person=pnewid
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
end update_psc_id_person;

PROCEDURE update_psc_id_clock(pid_clock IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personsellclock
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
end update_psc_id_clock;


FUNCTION getpersonsellclockIdPerson(pid_clock IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person
    into vcName
    from personsellclock
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


FUNCTION getpersonsellclockIdClock(pid_person IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_clock
    into vcID
    from personsellclock
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
END control_personsellclock;