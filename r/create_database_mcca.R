source("r/read_sql.R")
source("r/connection.R")

mssql <- MSSQL.Connection$new()
DBI::dbExecute(conn = mssql$connection,read_sql("ddl/mcca_database_create.sql"))

if (sys.nframe() == 0 ) {
  source("r/connection.R")
  mssql <- MSSQL.Connection$new()
  "
  SELECT name, create_date
  FROM sys.databases 
  WHERE name = 'mcca'
  " |>
  DBI::dbGetQuery(conn = mssql$connection)
}

