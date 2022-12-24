-- !preview conn=mssql$connection

USE mcca
IF EXISTS (SELECT * FROM sysobjects WHERE name='membership' and xtype='U')
  BEGIN
    DROP TABLE dbo.membership
  END
