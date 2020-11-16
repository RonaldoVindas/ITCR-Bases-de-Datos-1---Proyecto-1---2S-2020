Create or replace package control_shipping_type is
PROCEDURE insert_shipping_type (pdescription IN VARCHAR2);
PROCEDURE remove_shipping_type (pid_shipping_type IN NUMBER);
PROCEDURE update_sp_description(pid_shipping_type IN NUMBER, pdescription IN VARCHAR2);
FUNCTION get_SP_Description(pid_shipping_type IN NUMBER) RETURN VARCHAR2;
FUNCTION get_SP_id(pdescription varchar2) return number;
end control_shipping_type;
/
CREATE OR REPLACE PACKAGE BODY control_shipping_type IS

PROCEDURE insert_shipping_type (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO shipping_type(description)
	VALUES(pdescription);
END insert_shipping_type;

PROCEDURE remove_shipping_type(pid_shipping_type IN NUMBER) AS
e_invalid_shipping_type EXCEPTION;
BEGIN
	DELETE FROM shipping_type
	WHERE id_shipping_type = pid_shipping_type;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_shipping_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_shipping_type THEN
        DBMS_OUTPUT.PUT_LINE('No such shipping type.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_shipping_type;


PROCEDURE update_sp_description(pid_shipping_type IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_shipping_type EXCEPTION;
BEGIN
	UPDATE shipping_type
	SET description = pdescription
	WHERE id_shipping_type = pid_shipping_type;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_shipping_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_shipping_type THEN
        DBMS_OUTPUT.PUT_LINE('No such shipping type.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_sp_description;


FUNCTION get_sp_Description(pid_shipping_type IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcDescription
        FROM shipping_type
        WHERE id_shipping_type = pid_shipping_type;
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
    
    
    
    
FUNCTION get_sp_id(pdescription varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_shipping_type
        INTO vcID
        FROM shipping_type
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
end control_shipping_type;