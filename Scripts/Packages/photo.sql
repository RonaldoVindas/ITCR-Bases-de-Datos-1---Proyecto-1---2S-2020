Create or replace package control_photo is
PROCEDURE insert_photo (pdescription IN VARCHAR2);
PROCEDURE remove_photo (pid_photo IN NUMBER);
PROCEDURE update_photo_name(pid_photo IN NUMBER, pdescription IN VARCHAR2);
FUNCTION getphotoname(pid_photo IN NUMBER) RETURN VARCHAR2;
FUNCTION get_photo_id(pdescription varchar2) return number;
end control_photo;
/
CREATE OR REPLACE PACKAGE BODY control_photo IS

PROCEDURE insert_photo (pdescription IN VARCHAR2) AS
BEGIN
	INSERT INTO photo(name)
	VALUES(pdescription);
END insert_photo;

PROCEDURE remove_photo (pid_photo IN NUMBER) AS
e_invalid_photo EXCEPTION;
BEGIN
	DELETE FROM photo
	WHERE id_photo = pid_photo;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_photo;
    END IF;
    EXCEPTION
    WHEN e_invalid_photo THEN
        DBMS_OUTPUT.PUT_LINE('No such photo.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_photo;


PROCEDURE update_photo_name(pid_photo IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_photo EXCEPTION;
BEGIN
	UPDATE photo
	SET name = pdescription
	WHERE id_photo = pid_photo;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_photo;
    END IF;
    EXCEPTION
    WHEN e_invalid_photo THEN
        DBMS_OUTPUT.PUT_LINE('No such photo.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_photo_name;


FUNCTION getphotoname(pid_photo IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT name
        INTO vcDescription
        FROM photo
        WHERE id_photo = pid_photo;
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
    
    
    
    
FUNCTION get_photo_id(pdescription varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_photo
        INTO vcID
        FROM photo
        WHERE name = pdescription;
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
end control_photo;