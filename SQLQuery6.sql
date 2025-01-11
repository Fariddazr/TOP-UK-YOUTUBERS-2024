-- Data cleaning steps
--remove unecessary columns by only selecting the ones need 
--Extract the Youtube channel from the first columns
--rename the columns names 

SELECT NOMBRE,SEGUIDORES,ALCANCE_POTENCIAL
FROM Youtube_db..[youtube_data_united-kingdom]


--select charindex('@',NOMBRE) ,NOMBRE
--FROM Youtube_db..[youtube_data_united-kingdom]
use Youtube_db;
CREATE VIEW view_UK_youtubers_2024 as
SELECT 
	CAST(SUBSTRING(NOMBRE,1,charindex('@',NOMBRE)-1) as VARCHAR(100)) as channel_name ,
	total_subscribers,
	total_views,
	total_videos
FROM 
	Youtube_db..youtube_data_from_python

--SELECT * FROM Youtube_db..youtube_data_from_python

-- Data quality tests :
--1.The data needs to be 100 records of Youtube channels (row count test)
--2.The data needs 4 fields (column count test)
--3.The channel name column must be string format ,and the other columns must be numerical data types (data type check)
--4.Each record must be unique in the dataset (duplicate count check)

--ROW COUNT - 100
SELECT COUNT(*)  as Number_of_rows FROM Youtube_db..youtube_data_from_python

--Column count - 4

SELECT COUNT(*) as Column_Count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_UK_youtubers_2024';


-- Channel name - VARCHAR
--total subscribers - INTEGER
--total views _ INTEGER
--total videos - INTEGER

SELECT Column_name ,DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'view_UK_youtubers_2024';

--Duplicate count =0

SELECT channel_name ,
		COUNT(*) as duplicate_count
FROM	
		Youtube_db..youtube_data_from_python
GROUP BY 
		channel_name
HAVING 
		COUNT(*)>1







