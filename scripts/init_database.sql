--making the new datawarehouse using the medallion method

USE master;
go

if exists (select 1 from sys.databases where name = "DataWareHouse")
begin
  alter database DataWareHouse set single_user with rollback immediate


CREATE database DataWareHouse

use DataWareHouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go
