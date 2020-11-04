create or replace package control_paymethod is
procedure insert_pay_method(p_name in varchar2);
procedure remove_pay_method(pid in number);
procedure update_pay_method(p_name in varchar2, pid number);
function getPayMethodName(pId in number) return varchar2 ;
function getIDPayMethod(ppay_method in varchar2)return number;
end control_paymethod;
/
create or replace PACKAGE BODY control_paymethod IS

procedure insert_pay_method (p_name in varchar2)as
begin
    insert into pay_method(pay_method_type)
    values (p_name);
    commit;
end insert_pay_method;


procedure remove_pay_method(pid in number)as 
e_invalid_pm EXCEPTION;
begin
    delete from pay_method
    where id_pay_method = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_pm;
    END IF;
    EXCEPTION
    WHEN e_invalid_pm THEN
        DBMS_OUTPUT.PUT_LINE('No such pay method.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_pay_method;

procedure update_pay_method(p_name in varchar2, pid number)as 
e_invalid_pm EXCEPTION;
begin
    update pay_method
    set pay_method_type=p_name
    where id_pay_method=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_pm;
    END IF;
    EXCEPTION
    WHEN e_invalid_pm THEN
        DBMS_OUTPUT.PUT_LINE('No such pay method.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_pay_method;

function getPayMethodName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select pay_method_type
    into vcName
    from pay_method
    where id_pay_method=pID ;
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


function getIDPayMethod(ppay_method in varchar2)return number
is vcID NUMBER(10);
begin
    select id_pay_method
    into vcID
    from pay_method
    where pay_method_type=ppay_method;
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
END control_paymethod;