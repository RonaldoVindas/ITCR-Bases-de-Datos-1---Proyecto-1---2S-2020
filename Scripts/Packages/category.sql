Create or replace package control_category is
PROCEDURE insert_category (pdescription IN VARCHAR2);
PROCEDURE remove_category (pid_category IN NUMBER);
PROCEDURE update_category_description(pid_category IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getcategoryDescription(pid_category IN NUMBER) RETURN VARCHAR2;
FUNCTION get_category_id(pdescription varchar2) return number;
end control_category;
/
CREATE OR REPLACE PACKAGE BODY control_category IS

PROCEDURE insert_category (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO category(description)
	VALUES(pdescription);
END insert_category;

PROCEDURE remove_category (pid_category IN NUMBER) AS
e_invalid_category EXCEPTION;
BEGIN
	DELETE FROM category
	WHERE id_category = pid_category;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_category;
    END IF;
    EXCEPTION
    WHEN e_invalid_category THEN
        DBMS_OUTPUT.PUT_LINE('No such category.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_category;


PROCEDURE update_category_description(pid_category IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_category EXCEPTION;
BEGIN
	UPDATE category
	SET description = pdescription
	WHERE id_category = pid_category;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_category;
    END IF;
    EXCEPTION
    WHEN e_invalid_category THEN
        DBMS_OUTPUT.PUT_LINE('No such category.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_category_description;


FUNCTION getcategoryDescription(pid_category IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT description
        INTO vcDescription
        FROM category
        WHERE id_category = pid_category;
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
    
    
    
    
FUNCTION get_category_id(pdescription varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_category
        INTO vcID
        FROM category
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
end control_category;