USE master;
go

if exists (select 1 from sys.databases where name = "DatawareHouse")
begin
  


CREATE database DataWareHouse

use DataWareHouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go
