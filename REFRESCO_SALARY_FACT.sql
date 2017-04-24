--connect dw/dw@dw
--añade particion para año 2001
alter table salary_fact
add partition
p_2001 values less than (2002) tablespace dw
--preparar tabla de salarios del 2001, incrementando el salario original en 1.3
create table salary_emp_2001
(employee_id, salary, year)
as select EMPLOYEE_ID, SALARY * 1.3, 2001
from EMPLOYEES_TEMP;
--cargar datos del año 2001
insert into salary_fact
select year, employee_id, salary
from salary_emp_2001
--cargar datos del nuevo empleado del año 2001
insert into salary_fact
values (2001, 206, 20000);
--commit;
