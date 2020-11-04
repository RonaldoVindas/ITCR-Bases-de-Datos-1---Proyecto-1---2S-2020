create or replace package control_nationality is
procedure insert_nationality(p_name in varchar2);
procedure remove_nationality(pid in number);
procedure update_nationality(p_name in varchar2, pid number);
function getNationalityName(pId in number) return varchar2 ;
function getIDNationality(pnationality in varchar2)return number;
end control_nationality;
/
create or replace PACKAGE BODY control_nationality IS

procedure insert_nationality (p_name in varchar2)as
begin
    insert into nationality(nationality_name)
    values (p_name);
    commit;
end insert_nationality;


procedure remove_nationality(pid in number)as 
e_invalid_nat EXCEPTION;
begin
    delete from nationality
    where id_nationality = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_nat;
    END IF;
    EXCEPTION
    WHEN e_invalid_nat THEN
        DBMS_OUTPUT.PUT_LINE('No such nationality.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_nationality;

procedure update_nationality(p_name in varchar2, pid number)as 
e_invalid_nat EXCEPTION;
begin
    update nationality
    set nationality_name=p_name
    where id_nationality=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_nat;
    END IF;
    EXCEPTION
    WHEN e_invalid_nat THEN
        DBMS_OUTPUT.PUT_LINE('No such nationality.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_nationality;

function getNationalityName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select nationality_name
    into vcName
    from nationality
    where id_nationality=pID ;
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


function getIDNationality(pnationality in varchar2)return number
is vcID NUMBER(10);
begin
    select id_nationality
    into vcID
    from nationality
    where nationality_name=pnationality;
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
END control_nationality;