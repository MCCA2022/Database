source("r/read_sql.R")
source("r/connection.R")
source("r/create_database_mcca.R")

mssql <- MSSQL.Connection$new()
DBI::dbExecute(conn = mssql$connection,read_sql("ddl/membership_table_drop.sql"))

membership_ddl = readLines("ddl/membership_table_create.sql")[6:28] |> 
  gsub(pattern = "      ",replacement = "") |>
  strsplit(split = " ") |>
  sapply(function(.) paste(.[-1], collapse = " ") |> gsub(pattern = ",$",replacement = ""))

names(membership_ddl) = readLines("ddl/membership_table_create.sql")[6:28] |> 
  gsub(pattern = "      ",replacement = "") |>
  strsplit(split = " ") |>
  sapply(function(.).[1])

DBI::dbCreateTable(
  conn = mssql$connection,
  name = DBI::Id(database = "mcca", schema = "dbo", table = "membership"),
  fields = membership_ddl
)



if (sys.nframe() == 0) {
  
  source("r/connection.R")
  mssql <- MSSQL.Connection$new()
  
  DBI::dbExistsTable(
    conn = mssql$connection,
    name = DBI::Id(database = "mcca", schema = "dbo", table = "membership")
  )
  
  DF = data.frame(
    e_mail = 's',
    name_first = 'R',
    name_middle = 'H',
    name_last = 'M',
    dob = '1981',
    bgy = 'Pon',
    mun = 'Mcat',
    prv = 'Pa',
    reg = 'Reg',
    cel_no = '0',
    level = 'b,i,a',
    affiliations = 'a',
    affiliation_id = 'b',
    lichess_username = 'rho64',
    raison_detre = 'nothing',
    ra10173 = 'agree'
  )
  
  DBI::dbAppendTable(conn = mssql$connection,
                     name =  DBI::Id(database = "mcca", schema = "dbo", table = "membership"),
                     value = DF)
  
  DBI::dbReadTable(
    conn = mssql$connection,
    name =  DBI::Id(database = "mcca", schema = "dbo", table = "membership")
  )
  
}
