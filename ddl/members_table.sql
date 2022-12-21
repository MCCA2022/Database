-- !preview conn=mssql$connection

USE mcca
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='members' and xtype='U')
  BEGIN
    CREATE TABLE members (
      id INT PRIMARY KEY IDENTITY (1, 1),
      first_name VARCHAR,
      middle_name VARCHAR,
      last_name VARCHAR
    )
  END
