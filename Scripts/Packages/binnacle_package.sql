Create or replace package control_binnacle is
PROCEDURE insert_binnacle (plast_price IN VARCHAR2, plast_owner IN VARCHAR2);
PROCEDURE remove_binnacle (pid_binnacle IN NUMBER);
PROCEDURE update_binnacle_price(pid_binnacle IN NUMBER, plast_price IN VARCHAR2);
PROCEDURE update_binnacle_owner(pid_binnacle IN NUMBER, plast_owner IN VARCHAR2);
FUNCTION getbinnaclelastprice(pid_binnacle IN NUMBER) RETURN VARCHAR2;
FUNCTION getbinnaclelastowner(pid_binnacle IN NUMBER) RETURN VARCHAR2;
FUNCTION get_binnacle_id(plast_owner varchar2) return number;
end control_binnacle;
/
CREATE OR REPLACE PACKAGE BODY control_binnacle IS

PROCEDURE insert_binnacle(plast_price IN VARCHAR2, plast_owner IN VARCHAR2) AS
BEGIN
	INSERT INTO binnacle(last_price, last_clock_owner)
	VALUES(plast_price,plast_owner);
END insert_binnacle;

PROCEDURE remove_binnacle (pid_binnacle IN NUMBER) AS
e_invalid_binnacle EXCEPTION;
BEGIN
	DELETE FROM binnacle
	WHERE id_binnacle = pid_binnacle;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_binnacle;
    END IF;
    EXCEPTION
    WHEN e_invalid_binnacle THEN
        DBMS_OUTPUT.PUT_LINE('No such binnacle.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_binnacle;


PROCEDURE update_binnacle_price(pid_binnacle IN NUMBER, plast_price IN VARCHAR2) AS
e_invalid_binnacle EXCEPTION;
BEGIN
	UPDATE binnacle
	SET last_price = plast_price
	WHERE id_binnacle = pid_binnacle;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_binnacle;
    END IF;
    EXCEPTION
    WHEN e_invalid_binnacle THEN
        DBMS_OUTPUT.PUT_LINE('No such binnacle.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_binnacle_price;

PROCEDURE update_binnacle_owner(pid_binnacle IN NUMBER, plast_owner IN VARCHAR2) AS
e_invalid_binnacle EXCEPTION;
BEGIN
	UPDATE binnacle
	SET last_clock_owner = plast_owner
	WHERE id_binnacle = pid_binnacle;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_binnacle;
    END IF;
    EXCEPTION
    WHEN e_invalid_binnacle THEN
        DBMS_OUTPUT.PUT_LINE('No such binnacle.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_binnacle_owner;


FUNCTION getbinnaclelastprice(pid_binnacle IN NUMBER) RETURN VARCHAR2
IS 
    vcDescription VARCHAR2(50);
    BEGIN
        SELECT last_price
        INTO vcDescription
        FROM binnacle
        WHERE id_binnacle = pid_binnacle;
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
    
    
FUNCTION getbinnaclelastowner(pid_binnacle IN NUMBER) RETURN VARCHAR2
IS
     vcDescription VARCHAR2(50);
    BEGIN
        SELECT last_clock_owner
        INTO vcDescription
        FROM binnacle
        WHERE id_binnacle = pid_binnacle;
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
    
FUNCTION get_binnacle_id(plast_owner varchar2) return number

IS 
    vcID VARCHAR2(50);
    BEGIN
        SELECT id_binnacle
        INTO vcID
        FROM binnacle
        WHERE last_clock_owner = plast_owner;
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
end control_binnacle;