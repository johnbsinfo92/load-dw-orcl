--Databaselink lord para conectarse desde de a orcl
--connect dw/dw@dw

create database link lorcl
connect to hr identified by hr
using 'orcl'

--Tabla de Dimensión employess_dim
create table employees_dim
(
      empid number(6),
      nombre varchar2(20),
      apellido varchar2(25),
      email varchar2(25),
      telefono varchar2(20),
      jobid varchar2(10),
      mgrid number(6),
      deptid number(4),
      departmentname varchar2(30)
)
tablespace dw

--Tabla de Dimensión time_dim
create table time_dim
(
      year number(4),
      description varchar2(100)
)
tablespace dw

--Tabla de hechos salary_fact, particionada por rango.
create table salary_fact
(
      year number(4),
      empid number(6),
      salary number(8,2)
)
partition by range (year)
(
  partition P_1998 values less than (1999) tablespace dw,
  partition P_1999 values less than (2000) tablespace dw,
  partition P_2000 values less than (2001) tablespace dw
);

--constraint de las tablas
--pk
alter table employees_dim
add constraint empid_pk primary key (empid);

alter table time_dim
add constraint year_pk primary key (year);
--fk
alter table salary_fact
add constraint empid_fk foreign key (empid) references
employees_dim (empid);

alter table salary_fact
add constraint year_fk foreign key (year) references
time_dim (year);
