create or replace package control_review is
procedure insert_review(p_name in varchar2);
procedure remove_review(pid in number);
procedure update_review(p_name in varchar2, pid number);
function getReview(pId in number) return varchar2 ;
function getIDreview(p_review in varchar2)return number;
end control_review;
/
create or replace PACKAGE BODY control_review IS

procedure insert_review (p_name in varchar2)as
begin
    insert into review(stars)
    values (p_name);
    commit;
end insert_review;


procedure remove_review(pid in number)as 
e_invalid_review EXCEPTION;
begin
    delete from review
    where id_review = pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_review;
    END IF;
    EXCEPTION
    WHEN e_invalid_review THEN
        DBMS_OUTPUT.PUT_LINE('No such review.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_review;

procedure update_review(p_name in varchar2, pid number)as 
e_invalid_review EXCEPTION;
begin
    update review
    set stars=p_name
    where id_review=pid;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_review;
    END IF;
    EXCEPTION
    WHEN e_invalid_review THEN
        DBMS_OUTPUT.PUT_LINE('No such review.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_review;

function getReview(pId in number) return varchar2 
is vcName NUMBER(30);
begin
    select stars
    into vcName
    from review
    where id_review=pID ;
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


function getIDreview(p_review in varchar2)return number
is vcID NUMBER(10);
begin
    select id_review
    into vcID
    from review
    where stars=p_review;
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
END control_review;