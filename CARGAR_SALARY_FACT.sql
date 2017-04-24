--connect dw/dw@dw

create table salary_emp_1998
(employee_id,salary,year)
as select EMPLOYEE_ID, SALARY, 1998
from EMPLOYEES_TEMP

create table salary_emp_1999
(employee_id,salary,year)
as select EMPLOYEE_ID, SALARY*1.1, 1999
from EMPLOYEES_TEMP

create table salary_emp_2000
(employee_id,salary,year)
as select EMPLOYEE_ID, SALARY*1.2, 2000
from EMPLOYEES_TEMP

insert into salary_fact
select year, employee_id, salary
from salary_emp_1998
union
select year, employee_id, salary
from salary_emp_1999
union
select year, employee_id, salary
from salary_emp_2000
