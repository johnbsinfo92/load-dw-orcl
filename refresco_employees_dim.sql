-- MERGE que leerá los datos de la tabla externa y los comparará
--con la tabla EMPLOYEES_DIM. Si ya existe el empleado, lo actualiza, si
--no existe, lo inserta.
MERGE INTO employees_dim E
USING ext_employees_dim T
ON (e.empid=t.empid)
WHEN MATCHED THEN
UPDATE SET e.nombre=t.nombre,
	   e.apellido=t.apellido,
	   e.email=t.email,
	e.telefono=t.telefono,
	e.jobid=t.jobid,
	e.mgrid=t.mgrid,
	e.deptid=t.deptid,
	e.departmentname=t.departmentname
WHEN NOT MATCHED THEN
INSERT (E.EMPID, E.NOMBRE, E.APELLIDO, E.EMAIL, E.TELEFONO, E.JOBID, E.MGRID, E.DEPTID, E.DEPARTMENTNAME)
VALUES (T.EMPID, T.NOMBRE, T.APELLIDO, T.EMAIL, T.TELEFONO, T.JOBID, T.MGRID, T.DEPTID, T.DEPARTMENTNAME);
