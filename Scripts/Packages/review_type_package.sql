create or replace package control_review_type is
procedure insert_review_type(p_name in varchar2);
procedure remove_review_type(pid in number);
procedure update_review_type(p_name in varchar2, pid number);
function getreview_type(pId in number) return varchar2 ;
function getIDreview_type(p_review_type in varchar2)return number;
end control_review_type;
/
create or replace PACKAGE BODY control_review_type IS

procedure insert_review_type (p_name in varchar2)as
begin
    insert into review_type(review_type_name)
    values (p_name);
    commit;
end insert_review_type;


procedure remove_review_type(pid in number)as 
e_invalid_review_type EXCEPTION;
begin
    delete from review_type
    where id_review_type = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_review_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_review_type THEN
        DBMS_OUTPUT.PUT_LINE('No such review_type.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_review_type;

procedure update_review_type(p_name in varchar2, pid number)as 
e_invalid_review_type EXCEPTION;
begin
    update review_type
    set review_type_name=p_name
    where id_review_type=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_review_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_review_type THEN
        DBMS_OUTPUT.PUT_LINE('No such review_type.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_review_type;

function getreview_type(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select review_type_name
    into vcName
    from review_type
    where id_review_type=pID ;
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


function getIDreview_type(p_review_type in varchar2)return number
is vcID NUMBER(10);
begin
    select id_review_type
    into vcID
    from review_type
    where review_type_name=p_review_type;
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
END control_review_type;