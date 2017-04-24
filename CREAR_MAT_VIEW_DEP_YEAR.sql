--CONECTAR COMO system/oracle@dw as sysdba
connect sys/oralce_4U@dw as sysdba
--privilegios create a dw
grant create materialized view to dw;
--CONECTAR COMO dw/dw@dw
connect dw/dw@dw

create materialized view salary_sumary_fact
tablespace dw
build immediate
refresh complete
enable query rewrite
as
SELECT E.DEPTID, E.DEPARTMENTNAME, S.YEAR, SUM(S.SALARY)
FROM EMPLOYEES_DIM E, SALARY_FACT S
WHERE E.EMPID= S.EMPID
GROUP BY E.DEPTID, E.DEPARTMENTNAME, S.YEAR;
