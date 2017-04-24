--CREA LOS TABLESPACE

--create tablespace ods datafile 'C:\APP\TALLER\ORADATA\DW\ODS.DBF' SIZE 50M;
--create tablespace dw datafile 'C:\APP\TALLER\ORADATA\DW\DW.DBF' SIZE 50M;
--select name from v$datafile;

--CREA EL USUARIO DW
--create user dw identified by dw
--default tablespace ods
--temporary tablespace temp
--account unlock;

--grant connect, resource to dw;
--grant create database link to dw;
