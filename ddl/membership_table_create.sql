-- !preview conn=mssql$connection

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='membership' and xtype='U')
  BEGIN
    CREATE TABLE mcca.dbo.membership (
      id INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
      application_ts DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      name_first VARCHAR(256) NOT NULL,
      name_middle VARCHAR(256) NOT NULL,
      name_last VARCHAR(256) NOT NULL,
      dob VARCHAR(256) NOT NULL,
      bgy VARCHAR(256) NOT NULL,
      mun VARCHAR(256) NOT NULL,
      prv VARCHAR(256) NOT NULL,
      reg VARCHAR(256) NOT NULL,
      e_mail VARCHAR(256) NOT NULL,
      cel_no VARCHAR(256),
      tel_no VARCHAR(256),
      level CHARACTER(256) NOT NULL,
      id_ncfp VARCHAR(256),
      id_fide VARCHAR(256),
      affiliations VARCHAR(256),
      affiliation_id VARCHAR(256),
      lichess_username VARCHAR(256),
      raison_detre VARCHAR(256),
      ra10173 CHARACTER(256) NOT NULL,
      approved CHARACTER(256),
      approved_ts DATETIME
    )
  END
