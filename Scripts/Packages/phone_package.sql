create or replace package control_phone is
procedure insert_phone(p_name in number);
procedure remove_phone(pid in number);
procedure update_phone(p_name in number, pid number);
function getPhoneNumber(pId in number) return number ;
function getIDphone(pphone in number)return number;
end control_phone;
/
create or replace PACKAGE BODY control_phone IS

procedure insert_phone (p_name in number)as
begin
    insert into phone(phone_number)
    values (p_name);
    commit;
end insert_phone;


procedure remove_phone(pid in number)as 
e_invalid_phone EXCEPTION;
begin
    delete from phone
    where id_phone = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_phone;
    END IF;
    EXCEPTION
    WHEN e_invalid_phone THEN
        DBMS_OUTPUT.PUT_LINE('No such phone.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_phone;

procedure update_phone(p_name in number, pid number)as 
e_invalid_phone EXCEPTION;
begin
    update phone
    set phone_number=p_name
    where id_phone=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_phone;
    END IF;
    EXCEPTION
    WHEN e_invalid_phone THEN
        DBMS_OUTPUT.PUT_LINE('No such phone.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_phone;

function getPhoneNumber(pId in number) return number
is vcName number(30);
begin
    select phone_number
    into vcName
    from phone
    where id_phone=pID ;
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


function getIDphone(pphone in number)return number
is vcID NUMBER(10);
begin
    select id_phone
    into vcID
    from phone
    where phone_number=pphone;
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
END control_phone;