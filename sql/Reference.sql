-- Where is my other reference??

select *
from User U1
where time_stamp = (
  select max(time_stamp)
  from User
  where username = U1.username)


# Command Reference
IF - THEN
  cannot be used inside select statements
  if-then is a condition

CASE
  cannot evaluate over an array


/************************************************************/
  /* Remove Carriage Return / line Feed */

  SELECT
  	 T0.DocNum
  	 , T0.DocStatus
  	 , T0.CardCode
  	 , REPLACE(REPLACE(T0.Comments,char(10),' '),char(13), ' ') Comments
  FROM ORDR T0
  WHERE T0.DocDate >= '2014-01-01'
