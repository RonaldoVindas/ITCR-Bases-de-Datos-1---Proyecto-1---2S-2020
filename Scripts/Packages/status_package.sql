Create or replace package control_status is
PROCEDURE insert_status (pdescription IN VARCHAR2);
PROCEDURE remove_status (pid_status IN NUMBER);
PROCEDURE update_status_description(pid_status IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getStatusDescription(pid_status IN NUMBER) RETURN VARCHAR2;
FUNCTION get_Status_id(pdescription varchar2) return number;
end control_status;
/
CREATE OR REPLACE PACKAGE BODY control_status IS

PROCEDURE insert_status (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO status(description)
	VALUES(pdescription);
END insert_status;

PROCEDURE remove_status (pid_status IN NUMBER) AS
e_invalid_status EXCEPTION;
BEGIN
	DELETE FROM status
	WHERE id_status = pid_status;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_status;
    END IF;
    EXCEPTION
    WHEN e_invalid_status THEN
        DBMS_OUTPUT.PUT_LINE('No such status.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_status;


PROCEDURE update_status_description(pid_status IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_status EXCEPTION;
BEGIN
	UPDATE status
	SET description = pdescription
	WHERE id_status = pid_status;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_status;
    END IF;
    EXCEPTION
    WHEN e_invalid_status THEN
        DBMS_OUTPUT.PUT_LINE('No such status.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_status_description;


FUNCTION getstatusDescription(pid_status IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcDescription
        FROM status
        WHERE id_status = pid_status;
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
    
    
    
    
FUNCTION get_status_id(pdescription varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_status
        INTO vcID
        FROM status
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
end control_status;