-- START POSTGRESQL SCRIPT

-- Database: songs_data_v2_db

#######################################################################
-- DATABASE DESIGN
#######################################################################

-- Create Table
DROP TABLE IF EXISTS songs_tb;

CREATE TABLE IF NOT EXISTS songs_tb (
song_id INT PRIMARY KEY,
title VARCHAR(300),
artist VARCHAR(300),
album VARCHAR(300),
year_released SMALLINT,
duration DECIMAL(9,3),
tempo DECIMAL(9,3),
loudness DECIMAL(9,3)
);


-- Import dataset into table
COPY songs_tb (
song_id,
title,
artist,
album,
year_released,
duration,
tempo,
loudness
) 
FROM 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\input_files\dbin_songs_data_v2.csv'
DELIMITER ','
CSV HEADER;


-- Preview table structure
select *
from songs_tb;

select count(*)
from songs_tb;


######################################################################
-- DATA CLEANING
######################################################################

START TRANSACTION;

-- Retrieving invalid records from the year_released column
SELECT MIN(year_released), MAX(year_released)
FROM songs_tb;


-- Retrieve distinct year_released
SELECT DISTINCT year_released
FROM songs_tb
ORDER BY year_released;


-- Retrieve records where year_released is 0
SELECT count(*)
FROM songs_tb
WHERE year_released = 0;


-- Delete records where year_released = 0
DELETE
FROM songs_tb
WHERE year_released = 0;  -- Confirm action by running the query above

   
-- Retrieve the range of values for duration, tempo and loudness. 
SELECT 
	MIN(duration) AS min_duration,
	MAX(duration) AS max_duration,
	MIN(tempo) AS min_tempo,
	MAX(tempo) AS max_tempo,
	MIN(loudness) AS min_loudness,
	MAX(loudness) AS max_loudness
FROM songs_tb;


-- Retrieve records where tempo = 0
SELECT COUNT(*) 
FROM songs_tb
WHERE tempo = 0;

SELECT * 
FROM songs_tb
WHERE tempo = 0;


-- Since tempo of a song MUST always be a POSITIVE value, delete invalid records
DELETE 
FROM songs_tb
WHERE tempo = 0;  -- Confirm action by running the query above


-- Retrieve records where loudness is greater than 0
SELECT * 
FROM songs_tb
WHERE loudness >= 0;

SELECT COUNT(*) 
FROM songs_tb
WHERE loudness >= 0;


-- Delete records with invalid loudness values, as the loudness of a song MUST always be a NEGATIVE.
DELETE 
FROM songs_tb
WHERE loudness >= 0;  -- Confirm action by running the query above


##################################################################################################
-- HYPOTHESIS FORMULATION / DATA ANALYSIS
##################################################################################################

-- 1. Analysing yearly release of Songs by number
SELECT 
	year_released, 
	count(song_id) AS num_songs_released
FROM songs_tb
GROUP BY year_released
ORDER BY year_released;



-- 2. Analysing how song duration might have changed with time
SELECT 
	year_released,
	ROUND(AVG(duration),2) as avg_duration
FROM songs_tb
GROUP BY year_released
ORDER BY year_released;



-- 3. Analysing how the tempo changed over time
SELECT 
	year_released, 
	ROUND(AVG(tempo)) AS avg_tempo
FROM songs_tb
GROUP BY year_released
ORDER BY year_released;



-- 4. Analysing how the loudness changed over time
SELECT 
	year_released, 
	ROUND(AVG(loudness),2) AS avg_loudness
FROM songs_tb
GROUP BY year_released
ORDER BY year_released;



-- 5. Top 20 artists with the most number of albums released
SELECT 
	distinct artist,
	COUNT(*) AS albums_released
FROM songs_tb
GROUP BY artist
ORDER BY albums_released DESC
LIMIT 20;



-- Exporting the clean song records as a csv File
COPY (SELECT * FROM songs_tb) 
TO 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\output_files\dbout_clean_songs_data_v5.0.csv' 
WITH (FORMAT CSV, HEADER);


-- ROLLBACK;

-- COMMIT;