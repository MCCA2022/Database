-- !preview conn=mssql$connection

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'mcca')
  BEGIN
    CREATE DATABASE mcca
  END
