create or replace package control_type_person is
procedure insert_type_person(p_name in varchar2);
procedure remove_type_person(pid in number);
procedure update_type_person( pid number,p_name in varchar2);
function gettype_person(pId in number) return varchar2 ;
function getIDtype_person(ptype_person in varchar2)return number;
end control_type_person;
/
create or replace PACKAGE BODY control_type_person IS

procedure insert_type_person (p_name in varchar2)as
begin
    insert into type_person(type_person_name)
    values (p_name);
    commit;
end insert_type_person;


procedure remove_type_person(pid in number)as 
e_invalid_type_person EXCEPTION;
begin
    delete from type_person
    where id_type_person = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_type_person;

procedure update_type_person(pid number,p_name in varchar2 )as 
e_invalid_type_person EXCEPTION;
begin
    update type_person
    set type_person_name=p_name
    where id_type_person=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_type_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_type_person THEN
        DBMS_OUTPUT.PUT_LINE('No such type of person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_type_person;

function gettype_person(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select type_person_name
    into vcName
    from type_person
    where id_type_person=pID ;
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


function getIDtype_person(ptype_person in varchar2)return number
is vcID NUMBER(10);
begin
    select id_type_person
    into vcID
    from type_person
    where type_person_name=ptype_person;
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
END control_type_person;