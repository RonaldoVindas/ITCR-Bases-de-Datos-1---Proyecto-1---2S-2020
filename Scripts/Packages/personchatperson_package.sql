create or replace package control_personchatperson is
PROCEDURE insert_personchatperson (pid_person1 IN NUMBER, pid_person2 NUMBER,pmessage VARCHAR2,pmessage_date DATE);
PROCEDURE remove_personchatperson (pid_person1 IN NUMBER);
PROCEDURE update_pcp_id_person_sender(pid_person2 IN NUMBER, pnewid NUMBER);
PROCEDURE update_pcp_id_person_reader(pid_person1 IN NUMBER, pnewid NUMBER);
PROCEDURE update_pcp_message(pid_person1 IN NUMBER, pmessage VARCHAR2);
PROCEDURE update_pcp_message_date(pid_person1 IN NUMBER, pmessage_date DATE);
FUNCTION getpcpIdPersonSender(pid_person2 IN NUMBER) RETURN NUMBER;
FUNCTION getpcpIdPersonReader(pid_person1 IN NUMBER) RETURN NUMBER;
FUNCTION getpcpMessage(pid_person1 IN NUMBER) RETURN VARCHAR2;
FUNCTION getpcpMessageDate(pid_person1 IN NUMBER) RETURN DATE;
end control_personchatperson;
/
create or replace PACKAGE BODY control_personchatperson IS

PROCEDURE insert_personchatperson (pid_person1 IN NUMBER, pid_person2 NUMBER,pmessage VARCHAR2,pmessage_date DATE)AS
begin
    insert into personchatperson(id_person1,id_person2,message,message_date)
    values (pid_person1,pid_person2,pmessage,pmessage_date);
    commit;
end insert_personchatperson;


PROCEDURE remove_personchatperson (pid_person1 IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from personchatperson
    where id_person1= pid_person1;
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
end remove_personchatperson;

PROCEDURE update_pcp_id_person_sender(pid_person2 IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personchatperson
    set id_person1=pnewid
    where id_person1=pid_person2;
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
end update_pcp_id_person_sender;

PROCEDURE update_pcp_id_person_reader(pid_person1 IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personchatperson
    set id_person2=pnewid
    where id_person2=pid_person1;
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
end update_pcp_id_person_reader;

PROCEDURE update_pcp_message(pid_person1 IN NUMBER, pmessage VARCHAR2)AS
e_invalid_exc EXCEPTION;
begin
    update personchatperson
    set message=pmessage
    where id_person1=pid_person1;
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
end update_pcp_message;

PROCEDURE update_pcp_message_date(pid_person1 IN NUMBER, pmessage_date DATE)AS
e_invalid_exc EXCEPTION;
begin
    update personchatperson
    set message_date=pmessage_date
    where id_person1=pid_person1;
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
end update_pcp_message_date;

FUNCTION getpcpIdPersonSender(pid_person2 IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person1
    into vcName
    from personchatperson
    where id_person2=pid_person2 ;
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

FUNCTION getpcpIdPersonReader(pid_person1 IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person2
    into vcName
    from personchatperson
    where id_person1=pid_person1 ;
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

FUNCTION getpcpMessage(pid_person1 IN NUMBER) RETURN VARCHAR2
is vcName varchar2(100);
begin
    select message
    into vcName
    from personchatperson
    where id_person1=pid_person1;
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


FUNCTION getpcpMessageDate(pid_person1 IN NUMBER) RETURN DATE
is vcNAME DATE;
begin
    select message_date
    into vcName
    from personchatperson
    where id_person1=pid_person1;
    return (VCNAME);
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
END control_personchatperson;