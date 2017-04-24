load data
infile 'c:\dw\years.text'
into table time_dim
fields terminated by ','
optionally enclosed by '"'
(YEAR,DESCRIPCION)