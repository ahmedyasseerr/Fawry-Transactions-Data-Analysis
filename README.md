# Fawry Transactions Data Analysis

## Project Overview
This project presents an end-to-end data analysis pipeline for analyzing a massive dataset of 2 million Fawry transaction records. The primary objective is to extract actionable business insights, identify transaction trends, and monitor key performance indicators (KPIs) through a robust data architecture and an interactive visualization dashboard.

## Tools & Technologies
*   **Python (Pandas):** Data cleaning, preprocessing, temporal data manipulation, and memory optimization.
*   **MySQL:** Relational database management, bulk data loading, schema design, and maintaining referential integrity (Primary/Foreign Keys).
*   **Microsoft Power BI:** Advanced data modeling, DAX calculations, and interactive dashboard design.

## Data Pipeline & Workflow

### 1. Data Processing & Optimization (Python)
*   Processed a raw dataset consisting of 2 million rows.
*   Optimized system memory allocation during processing by downcasting data types (e.g., converting large integers to int8/int16 and utilizing category types for repetitive text).
*   Standardized temporal data and corrected datetime formatting to ensure consistency across the dataset.

### 2. Database Engineering (MySQL)
*   Designed a structured relational database schema utilizing primary and foreign keys to link transactions, services, and merchants.
*   Executed bulk data insertion (`LOAD DATA INFILE`) for 2 million records, bypassing standard timeout limitations through optimized server configurations.
*   Ensured data integrity and handled constraint validations seamlessly during the migration process.

### 3. Data Visualization (Power BI)
*   Connected Power BI to the processed data to build a dynamic and interactive dashboard.
*   Designed intuitive visuals to track transaction volumes, revenue metrics, service performance, and user engagement across different platforms and geographic regions.

## Project Files & Links

*   **Interactive Dashboard:** You can view and download the final Power BI dashboard (.pbix) file here: [Power BI Dashboard on Google Drive](https://drive.google.com/drive/folders/1BcFum2HwAbaUYkx4aslCoPleRvjyLi-r)
*   **Dataset:** Due to GitHub's file size limits, the full dataset (2 million rows) is hosted externally. You can access the raw and cleaned CSV files here: [Dataset on Google Drive](https://drive.google.com/drive/folders/1BcFum2HwAbaUYkx4aslCoPleRvjyLi-r)

## How to Run This Project
1. Clone this repository to your local machine.
2. Download the dataset from the provided Google Drive link.
3. Run the Python scripts in the `Scripts` folder to perform data cleaning.
4. Execute the SQL queries in your MySQL environment to build the schema and load the data.
5. Open the `.pbix` file in Power BI Desktop to view the interactive dashboard.
