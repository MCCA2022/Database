-- !preview conn=mssql$connection

USE mcca
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='membership' and xtype='U')
  BEGIN
    CREATE TABLE membership (
      id INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
      application_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      email VARCHAR(100) NOT NULL,
      first_name VARCHAR(100) NOT NULL,
      middle_name VARCHAR(100) NOT NULL,
      last_name VARCHAR(100) NOT NULL,
      birth_date VARCHAR(100) NOT NULL,
      barangay VARCHAR(100) NOT NULL,
      city_municipality VARCHAR(100) NOT NULL,
      province VARCHAR(100) NOT NULL,
      region VARCHAR(100) NOT NULL,
      contact_number VARCHAR(100) NOT NULL,
      level CHARACTER(100) NOT NULL,
      affiliations VARCHAR(100) NOT NULL,
      affiliation_id VARCHAR(100) NOT NULL,
      lichess_username VARCHAR(100) NOT NULL,
      reason_and_goals_with_chess VARCHAR,
      RA10173 CHARACTER(100) NOT NULL,
      approved CHARACTER(100) NOT NULL 
    )
  END
