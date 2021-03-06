CREATE OR REPLACE PACKAGE control_person IS

FUNCTION EncryptPassword(pencrypt_password IN VARCHAR2) RETURN VARCHAR2;
PROCEDURE insert_person(pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR, pid_gender NUMBER, pid_nationality NUMBER, 
                                            pid_type_person NUMBER, pid_district NUMBER);
PROCEDURE insert_user(pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR2, pusername VARCHAR2, ppassword VARCHAR2, 
                                        pid_gender NUMBER, pid_nationality NUMBER, pid_type_person NUMBER, pid_district NUMBER);
PROCEDURE remove_person(pid_person IN NUMBER);
PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2);
PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2);
PROCEDURE update_person_birthday(pid_person IN NUMBER, pbirth_day IN DATE);
PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2);
PROCEDURE update_person_username(pid_person IN NUMBER, puser_name IN VARCHAR2);
PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2);
PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN NUMBER);
PROCEDURE update_person_id_nationality(pid_person IN NUMBER, pid_nationality IN NUMBER);
PROCEDURE update_person_type_person(pid_person IN NUMBER, ptype IN NUMBER);
PROCEDURE update_person_photo(pid_person IN NUMBER, pphoto IN NUMBER);
PROCEDURE update_person_district(pid_person IN NUMBER, pdistrict IN NUMBER);
FUNCTION getPersonFirstName(pid_person IN NUMBER) RETURN VARCHAR2 ;
FUNCTION getPersonLastName(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonBirthDay(pid_person IN NUMBER) RETURN DATE;
FUNCTION getPersonUsername(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonPassword(pid_person IN NUMBER) RETURN VARCHAR2;
FUNCTION getPersonIdGender(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonAge(pId IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdNationality(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdTypePerson(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdDistrict(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdPhoto(pid_person IN NUMBER) RETURN NUMBER;
FUNCTION getPersonIdentification(pid_person IN NUMBER) RETURN VARCHAR2 ;

END control_person; 
/





CREATE OR REPLACE PACKAGE BODY control_person IS

FUNCTION EncryptPassword(pencrypt_password IN VARCHAR2) RETURN VARCHAR2
AS
    data VARCHAR2(255);
    BEGIN
    data := rpad(pencrypt_password, (trunc(length(pencrypt_password)/8)+1)*8, chr(0) );
    dbms_obfuscation_toolkit.DESEncrypt
          ( input_string => data,
            key_string   => 'DBAKey03',
            encrypted_string=> data );
 
    RETURN data;
  END;
  


PROCEDURE insert_person(pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR, pid_gender NUMBER, pid_nationality NUMBER, 
                                            pid_type_person NUMBER, pid_district NUMBER)  AS

BEGIN 
	INSERT INTO person(id_person,first_name, last_name, birthday, email, id_gender, id_nationality, id_type_person,id_district)
	VALUES(pid_person,pfirst_name, plast_name, pbirth_day, pemail, pid_gender, pid_nationality, pid_type_person, pid_district);
	COMMIT;
END insert_person;


PROCEDURE insert_user(pid_person IN NUMBER,pfirst_name IN VARCHAR2, plast_name VARCHAR2, pbirth_day DATE,  pemail VARCHAR2, pusername VARCHAR2, ppassword VARCHAR2, 
                                        pid_gender NUMBER, pid_nationality NUMBER, pid_type_person NUMBER, pid_district NUMBER) AS
BEGIN 
	INSERT INTO person(id_person,first_name, last_name, birthday, email, username, user_password, id_gender, id_nationality, id_type_person, id_district)
	VALUES(pid_person,pfirst_name, plast_name, pbirth_day, pemail, pusername, encryptpassword(ppassword), pid_gender, pid_nationality,pid_type_person,pid_district);
    COMMIT;
END insert_user;

PROCEDURE remove_person (pid_person IN NUMBER) AS
e_invalid_person EXCEPTION;
BEGIN
	DELETE FROM person
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END remove_person;



PROCEDURE update_person_first_name(pid_person IN NUMBER, pfirst_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET first_name = pfirst_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_first_name;


PROCEDURE update_person_last_name(pid_person IN NUMBER, plast_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET last_name = plast_name
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_last_name;


PROCEDURE update_person_birthday(pid_person IN NUMBER, pbirth_day IN DATE) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET birthday = pbirth_day
    WHERE id_person = pid_person;
    COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_birthday;


PROCEDURE update_person_email(pid_person IN NUMBER, pemail IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET email = pemail
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_email;


PROCEDURE update_person_username(pid_person IN NUMBER, puser_name IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET username = puser_name
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_username;


PROCEDURE update_person_type_person(pid_person IN NUMBER, ptype IN NUMBER)
as
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_type_person = ptype
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_type_person;


PROCEDURE update_person_password(pid_person IN NUMBER, ppassword IN VARCHAR2) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET user_password = ppassword
	WHERE id_person = id_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_password;


PROCEDURE update_person_id_gender(pid_person IN NUMBER, pid_gender IN NUMBER) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_gender = pid_gender
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_gender;


PROCEDURE update_person_id_nationality(pid_person IN NUMBER, pid_nationality IN NUMBER) AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_nationality = pid_nationality
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_id_nationality;


PROCEDURE update_person_district(pid_person IN NUMBER, pdistrict IN NUMBER)AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_district = pdistrict
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_district;

PROCEDURE update_person_photo(pid_person IN NUMBER, pphoto IN NUMBER)AS
e_invalid_person EXCEPTION;
BEGIN
	UPDATE person
	SET id_photo = pphoto
	WHERE id_person = pid_person;
	COMMIT;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
END update_person_photo;


FUNCTION getPersonFirstName(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonFirstName VARCHAR2(20);
    BEGIN
        SELECT first_name
        INTO vcPersonFirstName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonFirstName);
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


FUNCTION getPersonLastName(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonLastName VARCHAR2(30);
    BEGIN
        SELECT last_name
        INTO vcPersonLastName
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonLastName);
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
    
FUNCTION getPersonBirthDay(pid_person IN NUMBER) RETURN DATE
IS 
    vcPersonBirthDay DATE;
    BEGIN
        SELECT birthday
        INTO vcPersonBirthDay
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonBirthDay);
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
  
FUNCTION getPersonEmail(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonEmail VARCHAR2(50);
    BEGIN
        SELECT email
        INTO vcPersonEmail
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonEmail);
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

    
FUNCTION getPersonUsername(pid_person IN NUMBER) RETURN VARCHAR2
IS 
    vcPersonUsername VARCHAR2(50);
    BEGIN
        SELECT username
        INTO vcPersonUsername
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonUsername);
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

FUNCTION getPersonPassword(pid_person IN NUMBER) RETURN VARCHAR2
IS
    vcPersonPassword VARCHAR(50);
    BEGIN
        SELECT user_password
        INTO vcPersonPassword
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonPassword);
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
    
FUNCTION getPersonIdGender(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdGender NUMBER(6);
    BEGIN
        SELECT id_gender
        INTO vcPersonIdGender
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdGender);
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
    
FUNCTION getPersonAge(pId IN NUMBER) RETURN NUMBER
IS vcAge NUMBER(4);
BEGIN
    SELECT  Trunc((sysdate-birthday)/365) 
    INTO vcAge
    FROM person 
    WHERE id_person = pId;
    RETURN (vcAge);
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


FUNCTION getPersonIdNationality(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdNat NUMBER(6);
    BEGIN
        SELECT id_nationality
        INTO vcPersonIdNat
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdNat);
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
    
FUNCTION getPersonIdPhoto(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdPhoto NUMBER(6);
    BEGIN
        SELECT id_photo
        INTO vcPersonIdPhoto
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdPhoto);
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
    
FUNCTION getPersonIdDistrict(pid_person IN NUMBER) RETURN NUMBER
IS
    vcPersonIdDistrict NUMBER(6);
    BEGIN
        SELECT id_district
        INTO vcPersonIdDistrict
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdDistrict);
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



FUNCTION getPersonIdTypePerson(pid_person IN NUMBER) RETURN NUMBER
IS 
    vcPersonIdTypePerson NUMBER(6);
    BEGIN
        SELECT id_type_person
        INTO vcPersonIdTypePerson
        FROM person
        WHERE id_person = pid_person;
        RETURN(vcPersonIdTypePerson);
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
    
FUNCTION getPersonIdentification(pusername IN VARCHAR2) RETURN NUMBER
IS 
    vcPersonID NUMBER(9);
    BEGIN
        SELECT id_person
        INTO vcPersonID
        FROM person
        WHERE username = pusername;
        RETURN(vcPersonID);
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



END control_person;