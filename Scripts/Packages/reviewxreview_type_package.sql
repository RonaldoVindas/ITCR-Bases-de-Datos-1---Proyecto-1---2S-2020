create or replace package control_reviewxreview_type is
PROCEDURE insert_reviewxreview_type(pid_review IN NUMBER, pid_review_type NUMBER);
PROCEDURE remove_reviewxreview_type(pid_review IN NUMBER);
PROCEDURE update_rxrt_id_review(pid_review IN NUMBER, pnewid NUMBER);
PROCEDURE update_rxrt_id_review_type(pid_review_type IN NUMBER, pnewid NUMBER);
FUNCTION getrxrtIdreview(pid_review_type IN NUMBER) RETURN NUMBER;
FUNCTION getrxrtIdReviewtype(pid_review IN NUMBER) RETURN NUMBER;
end control_reviewxreview_type;
/
create or replace PACKAGE BODY control_reviewxreview_type IS

PROCEDURE insert_reviewxreview_type(pid_review IN NUMBER, pid_review_type NUMBER)AS
begin
    insert into reviewxreview_type(id_review,id_review_type)
    values (pid_review,pid_review_type);
    commit;
end insert_reviewxreview_type;


PROCEDURE remove_reviewxreview_type(pid_review IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from reviewxreview_type
    where id_review= pid_review;
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
end remove_reviewxreview_type;

PROCEDURE update_rxrt_id_review(pid_review IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update reviewxreview_type
    set id_review=pnewid
    where id_review=pid_review;
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
end update_rxrt_id_review;



PROCEDURE update_rxrt_id_review_type(pid_review_type IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update reviewxreview_type
    set id_review_type=pnewid
    where id_review_type=pid_review_type;
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
end update_rxrt_id_review_type;


FUNCTION getrxrtIdreview(pid_review_type IN NUMBER) RETURN NUMBER

is vcName number(30);
begin
    select id_review
    into vcName
    from reviewxreview_type
    where id_review_type=pid_review_type ;
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


FUNCTION getrxrtIdReviewtype(pid_review IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_review_type
    into vcID
    from reviewxreview_type
    where id_review=pid_review;
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
END control_reviewxreview_type;