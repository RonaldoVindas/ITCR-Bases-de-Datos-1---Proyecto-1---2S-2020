Create or replace package control_condition is
PROCEDURE insert_condition (pdescription IN VARCHAR2);
PROCEDURE remove_condition (pid_condition IN NUMBER);
PROCEDURE update_condition_description(pid_condition IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getconditionDescription(pid_condition IN NUMBER) RETURN VARCHAR2;
FUNCTION get_condition_id(pdescription varchar2) return number;
end control_condition;
/
CREATE OR REPLACE PACKAGE BODY control_condition IS

PROCEDURE insert_condition (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO condition(description)
	VALUES(pdescription);
END insert_condition;

PROCEDURE remove_condition (pid_condition IN NUMBER) AS
e_invalid_condition EXCEPTION;
BEGIN
	DELETE FROM condition
	WHERE id_condition = pid_condition;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_condition;
    END IF;
    EXCEPTION
    WHEN e_invalid_condition THEN
        DBMS_OUTPUT.PUT_LINE('No such condition.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_condition;


PROCEDURE update_condition_description(pid_condition IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_condition EXCEPTION;
BEGIN
	UPDATE condition
	SET description = pdescription
	WHERE id_condition = pid_condition;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_condition;
    END IF;
    EXCEPTION
    WHEN e_invalid_condition THEN
        DBMS_OUTPUT.PUT_LINE('No such condition.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_condition_description;


FUNCTION getconditionDescription(pid_condition IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcDescription
        FROM condition
        WHERE id_condition = pid_condition;
        RETURN (vcDescription);
        EXCEPTION
            WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcnombre.');
            WHEN STORAGE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
            WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
    END;
    
    
    
    
FUNCTION get_condition_id(pdescription varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_condition
        INTO vcID
        FROM condition
        WHERE description = pdescription;
        RETURN (vcID);
        EXCEPTION
            WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
            WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcnombre.');
            WHEN STORAGE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
            WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
            WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
    END;
end control_condition;