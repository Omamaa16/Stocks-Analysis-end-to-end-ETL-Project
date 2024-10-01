# Stocks' Analysis Project for 500 companies worldwide.
An end-to-end ETL project grounded up from scratch, to analyze the stock market for 500 companies worldwide. 

## Introduction
Grounded up a data warehouse upon stocks' big data, sourced by Kaggle (insert that link) for the last 14 years, for over 500 companies.
The projected was initiated by conducting an exploratory analysis via the Python scripts utilising the Panda's Dataframe, followed by manipulating the data in accordance to the business question. 
The data was dumped into the PostgreSQL and a snowflake schema data model was grounded up using SQL in the frameworks of SQLShell and pgAdmin. 
Admist, in order to maintain the data integrity, surrogates were generated as well, using SQL.
Finally, the data was connected to the PowerBI using the appropriate cardinalities and relationships, leveraging DAX queries, quick measures, measured columns, and measured tables to build deeper contexts. 

## Challenges: 
• Limited KPI's were present to draw financial conclusions. Insights inclusive of the CurrentRatio/Price-to-Earning ratio ect could not be accounted for a conclusion on stronger grounds.
• The syntax of the SQLshell differs slightly from that of the standard SQL; hence, alot of time had to be bought into it.

## Project Architecture
![Project Architecture](https://github.com/Omamaa16/Stocks-Analysis-end-to-end-ETL-Project/blob/main/Project%20Architecture.pdf)

## Technology and services used
1 - Extraction and staging.
• Python Libraries: opendatasets - to download the Kaggle big dataset.
2 - Transformation.
• Jupyter Notebook - pandas and numpy (Python)
PostgreSQL - pgAdmin and SQLShell - to perform data modeling and generate surrogate keys.
3 - Loading.
• PostgreSQL - to build the data warehouse.
Python library: SQLalchemy to migrate the data from the jupyter to the postgre.
4 - Data Visualization.
• PowerBI - DAX queries. 

## Scripts Used
------------

## Methodology
Initiated a Data Warehouse project, from scratch, utilizing a big dataset for 500 companies worldwide. 
• The data was downloaded via the opendatsets python library.
• Performed exploratory data analysis using the Python pandas and NumPy, built on the framework of Jupyter notebook and manupilated data with relevant transformational rules.
• Migrated data to PostGRE using SQLalchemy and constructed relevant tables using pgAdmin and psql.
• Generated surrogates to preserve data integerity using PSQL/TSQL. Modeled data into a snowflake schema, using lucid charts. 
• Utilizing PowerBI and the DAX queries, analyzed the data while establishing.

## Assumption
• While drawing the pie donut chart, the highest value consisted of 4.19 billion - hence, in order to depict a clear stance, a random number of 4.25 billion was chosen as the final target. 
• The sheet "KSE" would not align with business interest, hence, it was dropped before the staging stage. 

## Conclusion
• The Canadian Apparel market to be the riskiest, having an aggregated volatility of 66M.
• 2013 to be the most stable year historically, proving to have had an aggregated $965B profit from all over the countries.
• US being the safest market while Singapore being the most unstable; USA generating 72.4% higher profit on average. 
• SMCI always being the most safe stock exchange market, responsible for an approximate 3.4% revenue growth per year.

## Other Information
• Data Set: "https://www.kaggle.com/datasets/andrewmvd/sp-500-stocks?select=sp500_companies.csv"
• Data Mode: 
