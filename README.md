# Songs Data Analysis
___

### Description/Background
___
This project analyzes a song data to identify changes in songs attributes (e.g. loudness, duration, tempo), genre trends, etc. 
Using exploratory data analysis and visualization, the project uncovers key insights into the musical elements of songs released over a period of time.


### Table of Contents
___
- [Description/Background](#description/background)
- [About the dataset](#about-the-dataset)
- [Technologies](#technologies)
- [Data Sources](#data-sources)
- [Usage Instructions](#usage-instructions)
- [Data Cleaning and Preprocessing](#data-cleaning-and-preprocessing)
- [Data Analysis](#data-analysis)
- [References](#references)
- [License](#license)

### About the dataset
___
The dataset includes various attributes of songs, such as title, artist, album, release date, duration, tempo and loudness. 

### Technologies
___
* PostgreSQL (for data cleaning, analysis, and visualisation)
* MS Excel (for data visualisation)

### Data Sources
___
Dataset was collected from a reputable music database, covering a broad period of time to provide a comprehensive look at music trends.

### Usage Instructions
___
- Data analysis can be performed on any preferred Database Management System. However, the queries in this project was written in PostgreSQL. Take note of syntax.
- Download dataset from this project repository into local machine. 
- On windows machine, enter ``` Windows + E ``` and paste the file path ```C:/ProgramData/MySQL/MySQL Server 8.0/Uploads``` on the file address to go into 'Uploads' folder.
- While in the 'Uploads' folder, create a folder named 'input_files' and copy the downloaded dataset files into this folder 
> [!CAUTION]
> You must perform the Steps above before running the SQL script.
- Open the "songs_data_analysis_queries.sql" file on your Database Management System and run the script. This should automatically create and import the dataset into a database and table.
> [!WARNING]
> Run each block of code individually for better experience.

### Data Cleaning and Preprocessing
___
