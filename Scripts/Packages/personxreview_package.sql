create or replace package control_personxreview is
PROCEDURE insert_personxreview (pid_person IN NUMBER,puser_comment IN VARCHAR2, pid_review NUMBER);
PROCEDURE remove_personxreview (pid_person IN NUMBER);
PROCEDURE update_pxr_id_person(pid_person IN NUMBER, pnewid NUMBER);
PROCEDURE update_pxr_comment(pid_person IN NUMBER, pcomment VARCHAR2);
PROCEDURE update_pxr_id_review(pid_review IN NUMBER, pnewid NUMBER);
FUNCTION getpersonxreviewIdPerson(pid_review IN NUMBER) RETURN NUMBER;
FUNCTION getpersonxreviewComment(pid_review IN NUMBER) RETURN VARCHAR2;
FUNCTION getpersonxreviewIdReview(pid_person IN NUMBER) RETURN NUMBER;
end control_personxreview;
/
create or replace PACKAGE BODY control_personxreview IS

PROCEDURE insert_personxreview (pid_person IN NUMBER,puser_comment IN VARCHAR2, pid_review NUMBER)AS
begin
    insert into personxreview(id_person,user_comment,id_review)
    values (pid_person,puser_comment,pid_review);
    commit;
end insert_personxreview;


PROCEDURE remove_personxreview (pid_person IN NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    delete from personxreview
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
end remove_personxreview;

PROCEDURE update_pxr_id_person(pid_person IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personxreview
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
end update_pxr_id_person;

PROCEDURE update_pxr_comment(pid_person IN NUMBER, pcomment VARCHAR2)AS
e_invalid_exc EXCEPTION;
begin
    update personxreview
    set user_comment=pcomment
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
end update_pxr_comment;



PROCEDURE update_pxr_id_review(pid_review IN NUMBER, pnewid NUMBER)AS
e_invalid_exc EXCEPTION;
begin
    update personxreview
    set id_review=pnewid
    where id_review=pid_review;
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
end update_pxr_id_review;


FUNCTION getpersonxreviewIdPerson(pid_review IN NUMBER) RETURN NUMBER
is vcName number(30);
begin
    select id_person
    into vcName
    from personxreview
    where id_review=pid_review ;
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

FUNCTION getpersonxreviewComment(pid_review IN NUMBER) RETURN VARCHAR2
is vcName number(30);
begin
    select user_comment
    into vcName
    from personxreview
    where id_review=pid_review;
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


FUNCTION getpersonxreviewIdReview(pid_person IN NUMBER) RETURN NUMBER
is vcID NUMBER(10);
begin
    select id_review
    into vcID
    from personxreview
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
END control_personxreview;