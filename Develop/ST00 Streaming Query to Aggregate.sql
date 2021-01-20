WITH Input AS(
	SELECT 
		* 
	FROM 
		ehinput 
	Partition By PartitionId
)
SELECT    
	*
INTO 
	dwgranular
FROM 
	Input 
Partition By PartitionId

SELECT 
	Dspl
	, avg(temp) as AvgTemp
	, max(hmdt) as MaxHmdt
	, PartitionId 
INTO dwaggregate 
FROM Input 
PARTITION BY PartitionID
GROUP BY TumblingWindow(second, 1), Dspl, PartitionId