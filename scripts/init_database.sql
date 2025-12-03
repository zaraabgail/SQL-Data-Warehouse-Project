-- Drop if exists, then create new DB and schemas
IF DB_ID('DataWareHouse') IS NOT NULL
BEGIN
    ALTER DATABASE [DataWareHouse] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [DataWareHouse];
END;
GO

CREATE DATABASE [DataWareHouse];
GO

USE [DataWareHouse];
GO

CREATE SCHEMA [bronze];
GO
CREATE SCHEMA [silver];
GO
CREATE SCHEMA [gold];
GO
