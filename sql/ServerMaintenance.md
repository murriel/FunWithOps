<!-- # Figure out a better format for this later -->

# Bulk copy
- notes
  command line utility in SQL Server 2008 and up that allows for bulk copy into and out of SQL Server

  running bcp brings up various command line options

  Database format for query: database.dbo.table

- flags
  -T integrated security
  -c character set for output

- examples
  bcp "SELECT TOP 10 UserName FROM myDB.dbo.myTable" queryout queryname.sql -T -c


# Maintenance Plan
  1. New Database -

  2. Create operator for receiving automated alerts
    SQL Server Agent - Operators

  3. Create Jobs for Maintenance
    CheckDB run check db on all databases

  4. Create jobs for Query Performance Monitoring

  5.
