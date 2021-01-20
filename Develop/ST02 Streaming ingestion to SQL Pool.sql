-- show number of records ingested to far
-- run below query 2 times with a second or more gap between two runs

SELECT count_big(*) 
FROM dbo.dwgranular 

-- diff number of records

DECLARE @before bigint =  ; -- Copy value from first run
DECLARE @after bigint =   ; -- Copy value from second run
DECLARE @million float = 1000000;
SELECT ROUND( (@after - @before) / @million , 2 ) AS RecordsMil