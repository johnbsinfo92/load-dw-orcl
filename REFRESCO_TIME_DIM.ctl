
load data
infile 'C:\Users\Taller\Desktop\ETL\years2001.txt'
append
into table time_dim
fields terminated by ','
optionally enclosed by '"'
(YEAR, DESCRIPTION)
