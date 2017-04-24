--primera carga
--connect dw/dw@dw;
create table employees_temp
tablespace ods
as select * from employees@lorcl;

create table departments_temp
tablespace ods
as select * from departments@lorcl;

--transformacion y carga de tablas
insert into employees_dim
select e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
e.job_id, e.manager_id, e.department_id, d.department_name
from employees_temp e, departments_temp d
where e.department_id= d.department_id(+);
