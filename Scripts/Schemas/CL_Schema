/*==================================================CREACIÓN DE TABLESPACES======================================================*/
/*TABLESPACE para Reloj = Clock = cl*/

CREATE TABLESPACE cl_data
DATAFILE 'C:\app\Ronaldo\oradata\DBRONALDO\clata01.dbf'          /*Cuidado con la ruta de ubicación de fichero - Cambiar de acuerdo a su máquina*/
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

CREATE TABLESPACE cl_ind
DATAFILE 'C:\app\Ronaldo\oradata\DBRONALDO\clind01.dbf'         /*Cuidado con la ruta de ubicación de fichero - Cambiar de acuerdo a su máquina*/
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

/*==================================================CREACIÓN DE ESQUEMAS======================================================*/

CREATE USER CL
IDENTIFIED BY CL
DEFAULT TABLESPACE cl_data
QUOTA 10M ON cl_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;

/*==================================================PERMISOS DE ESQUEMAS======================================================*/
/*PERMISOS DE CL*/

GRANT CONNECT TO cl;
GRANT CREATE SESSION TO cl;
GRANT CREATE TABLE TO cl;
GRANT CREATE SEQUENCE TO cl;
GRANT CREATE ANY TRIGGER, ALTER ANY TRIGGER, DROP ANY TRIGGER TO cl;

ALTER USER cl QUOTA UNLIMITED ON cl_data;
ALTER USER cl QUOTA UNLIMITED ON cl_ind;