MSSQL.Connection <- 
  R6::R6Class(
    
    classname = "MSSQL.Connection",
    
    public = 
      list(
        
        connection = NULL,
        
        initialize = function() {
          self$connection <- DBI::dbConnect(
            drv = odbc::odbc(),
            driver = "ODBC Driver 18 for SQL Server",
            UID = "sa",
            PWD = Sys.getenv("MSSQL_SA_PASSWORD"),
            server = Sys.getenv("MSSQL_HOST"),
            port = Sys.getenv("MSSQL_PORT"),
            TrustServerCertificate = "yes"
          )
        },
        
        finalize = function() {
          DBI::dbDisconnect(self$connection)
        }

      )
  )

if (sys.nframe() == 0) {
  mssql <- MSSQL.Connection$new()
  print(mssql$connection)
  DBI::dbGetQuery(conn = mssql$connection, "SELECT * FROM master.dbo.MSreplication_options")
}
