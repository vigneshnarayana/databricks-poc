show con_name

select name,open_mode
from v$pdbs;

alter session set container=orclpdb

show con_name

alter pluggable database orclpdb close;

select name,open_mode
from v$pdbs;

alter pluggable database orclpdb open;

select name,open_mode
from v$pdbs;

alter pluggable database all open;

--alter session set container =cdb$root
--show con_name
--alter pluggable database all open;