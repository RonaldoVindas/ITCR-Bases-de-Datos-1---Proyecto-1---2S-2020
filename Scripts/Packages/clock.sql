CREATE OR REPLACE PACKAGE control_clock IS

PROCEDURE insert_clock(pid_clock IN NUMBER,pname IN VARCHAR2, pmodel VARCHAR2, pdescription VARCHAR2,  pmanifacturing_Date NUMBER, pprice NUMBER, pid_binnacle NUMBER, pid_shipping_type NUMBER, 
                                            pid_category NUMBER, pid_brand NUMBER, pid_status NUMBER, pid_condition NUMBER, pid_photo NUMBER);
PROCEDURE remove_clock(pid_clock IN NUMBER);
PROCEDURE update_clock_name(pid_clock IN NUMBER, pname IN VARCHAR2);
PROCEDURE update_clock_model(pid_clock IN NUMBER, pmodel IN VARCHAR2);
PROCEDURE update_clock_description(pid_clock IN NUMBER, pdescription IN VARCHAR2);
PROCEDURE update_clock_date(pid_clock IN NUMBER, pmanifacturing_date IN NUMBER);
PROCEDURE update_clock_price(pid_clock IN NUMBER, pprice IN NUMBER);
PROCEDURE update_clock_id_binnacle(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_shipping(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_category(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_brand(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_status(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_condition(pid_clock IN NUMBER, pid IN NUMBER);
PROCEDURE update_clock_id_photo(pid_clock IN NUMBER, pid IN NUMBER);
FUNCTION getclockName(pid_clock IN NUMBER) RETURN VARCHAR2 ;
FUNCTION getclockmodel(pid_clock IN NUMBER) RETURN VARCHAR2 ;
FUNCTION getclockdescription(pid_clock IN NUMBER) RETURN VARCHAR2;
FUNCTION getclockdate(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockprice(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidbinnacle(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidshipping(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidcategory(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidbrand(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidstatus(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidcondition(pid_clock IN NUMBER) RETURN NUMBER;
FUNCTION getclockidphoto(pid_clock IN NUMBER) RETURN NUMBER;
END control_clock;
/
CREATE OR REPLACE PACKAGE BODY control_clock IS


PROCEDURE insert_clock(pid_clock IN NUMBER,pname IN VARCHAR2, pmodel VARCHAR2, pdescription VARCHAR2,  pmanifacturing_Date NUMBER, pprice NUMBER, pid_binnacle NUMBER, pid_shipping_type NUMBER, 
                                            pid_category NUMBER, pid_brand NUMBER, pid_status NUMBER, pid_condition NUMBER, pid_photo NUMBER)AS
BEGIN 
	INSERT INTO clock(id_clock, name, model, description,  manifacturing_Date, price, id_binnacle, id_shipping_type, 
                                            id_category, id_brand, id_status, id_condition, id_photo)
	VALUES(pid_clock, pname, pmodel, pdescription,  pmanifacturing_Date, pprice, pid_binnacle, pid_shipping_type, 
                                            pid_category, pid_brand, pid_status, pid_condition, pid_photo);
	COMMIT;
END insert_clock;

PROCEDURE remove_clock (pid_clock IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	DELETE FROM clock
	WHERE id_clock = pid_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_clock;



PROCEDURE update_clock_name(pid_clock IN NUMBER, pname IN VARCHAR2) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET name = pname
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_name;

PROCEDURE update_clock_model(pid_clock IN NUMBER, pmodel IN VARCHAR2) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET model = pmodel
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_model;

PROCEDURE update_clock_description(pid_clock IN NUMBER, pdescription IN VARCHAR2) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET description = pdescription
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_description;

PROCEDURE update_clock_date(pid_clock IN NUMBER, pmanifacturing_date IN NUMBER)AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET manifacturing_date = pmanifacturing_date
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_date;

PROCEDURE update_clock_price(pid_clock IN NUMBER, pprice IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET price = pprice
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_price;


PROCEDURE update_clock_id_binnacle(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_binnacle = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_binnacle;


PROCEDURE update_clock_id_shipping(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_shipping_type = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_shipping;

PROCEDURE update_clock_id_category(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_category = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_category;

PROCEDURE update_clock_id_brand(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_brand = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_brand;

PROCEDURE update_clock_id_status(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_status = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_status;

PROCEDURE update_clock_id_condition(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_condition = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_condition;

PROCEDURE update_clock_id_photo(pid_clock IN NUMBER, pid IN NUMBER) AS
e_invalid_clock EXCEPTION;
BEGIN
	UPDATE clock
	SET id_photo = pid
	WHERE id_clock = id_clock;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_clock;
    END IF;
    EXCEPTION
    WHEN e_invalid_clock THEN
        DBMS_OUTPUT.PUT_LINE('No such clock.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_clock_id_photo;

FUNCTION getclockName(pid_clock IN NUMBER) RETURN VARCHAR2
IS
    vcPerson VARCHAR2(100);
    BEGIN
        SELECT name
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockmodel(pid_clock IN NUMBER) RETURN VARCHAR2
IS
    vcPerson VARCHAR2(50);
    BEGIN
        SELECT model
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockdescription(pid_clock IN NUMBER) RETURN VARCHAR2
IS
    vcPerson VARCHAR2(500);
    BEGIN
        SELECT description
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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


FUNCTION getclockdate(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER;
    BEGIN
        SELECT manifacturing_date
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockprice(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT price
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidbinnacle(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_binnacle
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidshipping(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_shipping_type
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidcategory(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_category
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidbrand(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_brand
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidstatus(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_status
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidcondition(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_condition
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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

FUNCTION getclockidphoto(pid_clock IN NUMBER) RETURN NUMBER
IS
    vcPerson NUMBER(30);
    BEGIN
        SELECT id_photo
        INTO vcPerson
        FROM clock
        WHERE id_clock = pid_clock;
        RETURN(vcPerson);
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











END control_clock;

