/* Workday Calculations
	2014-09-04 Murriel Perez
	Scrambled together between various pieces.

	The code snippets below do the following:
	Set the "As of" date (ie. a date to use as basis for reporting)
	Set Start and End Date of the month based on the month of the date entered

	Find total # of working days in the month, based on the start and end of the month.
		* note: I also threw a check in there for the holidays entered into our ERP system
		This can be substituted by any other holiday table

	Find # of working days remaining, based on as of date entered and end of the month.
	Considers the current day as a working day remaining (hence the -1 at the end)

	Thx to http://livedev.com/programming/calculating-work-days-t-sql-sql-server-2008r2-2012-44.html
	http://weblog.kevinattard.com/2012/01/t-sql-number-of-working-days-between-2.html

	*/


DECLARE @myAsOfDate DATETIME = GETDATE()-1

DECLARE @myStartDate DATETIME
SET @myStartDate= (SELECT DATEADD(mm, DATEDIFF(mm,0,@myAsOfDate), 0))

DECLARE @myEndDate DATETIME
SET @myEndDate = (SELECT DATEADD(DD,-1,DATEADD(mm, DATEDIFF(m, 0, @myAsOfDate) + 1,0)))

--SELECT @myStartDate, @myEndDate

DECLARE @myWorkDaysTot INT
SET @myWorkDaysTot =
	( SELECT
	   (DATEDIFF(dd, @myStartDate, @myEndDate) + 1)
	  -(DATEDIFF(wk, @myStartDate, @myEndDate) * 2)
	  -(CASE WHEN DATENAME(dw, @myStartDate) = 'Sunday' THEN 1 ELSE 0 END)
	  -(CASE WHEN DATENAME(dw, @myEndDate) = 'Saturday' THEN 1 ELSE 0 END)
	  - (SELECT COUNT(*) FROM HLD1 H WHERE H.StrDate BETWEEN @myStartDate AND @myEndDate)
	  )

DECLARE @myWorkDaysLeft INT
SET @myWorkDaysLeft =
	( SELECT
	   (DATEDIFF(dd, @myAsOfDate, @myEndDate) + 1)
	  -(DATEDIFF(wk, @myAsOfDate, @myEndDate) * 2)
	  -(CASE WHEN DATENAME(dw, @myAsOfDate) = 'Sunday' THEN 1 ELSE 0 END)
	  -(CASE WHEN DATENAME(dw, @myEndDate) = 'Saturday' THEN 1 ELSE 0 END)
	  - (SELECT COUNT(*) FROM HLD1 H WHERE H.StrDate BETWEEN @myAsOfDate AND @myEndDate)
	  - 1
	  )

SELECT
	@myAsOfDate	AsOfDate
	, @myStartDate StartDate
	, @myEndDate EndDate
	, @myWorkDaysTot WorkDaysTotal
	, @myWorkDaysLeft WorkDaysLeft
