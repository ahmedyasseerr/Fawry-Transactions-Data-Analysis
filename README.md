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

*   **External Assets (Google Drive):** Due to GitHub's file size limits, the large files are hosted externally. You can access the **Python cleaning scripts**, the **raw and cleaned datasets (CSV)**, and the **interactive Power BI dashboard (.pbix)** here: [Project Files on Google Drive](https://drive.google.com/drive/folders/1BcFum2HwAbaUYkx4aslCoPleRvjyLi-r)
*   **GitHub Repository Contents:**
    *   `sql_final.sql`: The main SQL script used for database creation, table structuring, and data loading.
    *   `Schema.mwb`: The MySQL Workbench file containing the visual relational database schema.
    *   `Fawry_Presentation_Final .pptx`: The final project presentation detailing the analytical insights and business outcomes.

## How to Run This Project
1. Clone this repository to your local machine to access the SQL and presentation files.
2. Download the Python script, the datasets, and the Power BI dashboard from the provided Google Drive link.
3. Run the downloaded Python script locally to perform data cleaning and memory optimization on the raw dataset.
4. Open `Schema.mwb` in MySQL Workbench to view the relational model, or directly execute `sql_final.sql` in your MySQL environment to build the database structure and load the cleaned data.
5. Open the `.pbix` file in Power BI Desktop to interact with the dashboard.
6. Review the `Fawry_Presentation_Final .pptx` for a comprehensive summary of the project's key findings.
