# Replication Package – IDB Data Integration and Model

## Overview
This replication package reproduces the full workflow used to download, clean, and model data from the **Inter-American Development Bank (IDB) Open Data platform**.  
It integrates multiple datasets to generate a consistent panel for Latin American countries (2003–2022) using **R**, and estimates a fixed-effects model in **Stata**.  

The entire pipeline can be executed **with a single click** through the `Master_script.R` master script, which automatically handles environment setup, directory creation, and execution of both R and Stata code.

---

## Repository Structure

- **Master_script** - Executes the entire replication
- **/all_codes**
  - `replic_setup.R` - Environment setup (package install, paths)
  - `Ingest_clean_IDB_api.R` - Data ingestion and cleaning (R)
  - `IDB_fe_model.do` - Model estimation (Stata)
- **/IDB_Data_Analyst**
  - **/data** - Created automatically; stores processed data
  - **/outputs** - Created automatically; stores final results
    
---

## How to Run the Replication

### 1. One-click run
Run the pipeline by executing the **`Master_script.R`** file from R (RStudio or terminal).  
This single script performs all steps: setup → data ingestion and cleaning → model estimation → output generation.

### 2. Stata path setup (important)
By default, the script attempts to **automatically detect Stata** depending on your operating system.  
However, you **must specify the Stata path** as an input in two situations:

1. **Stata version is older than 17**, or  
2. **Stata is not installed in the default system path**.

The default system path where the code search for Stata.exe are:
stata_path <- "C:/Program Files/StataXX/"                                # Windows system
stata_path <- "/Applications/Stata/StataYY.app/Contents/MacOS/StataYY"   # macOS system
stata_path <- "/usr/local/stataXX/stata-mp"                              # Linux system

Where XX denotes the number version and YY the Stata type (SE, MP, BE)

If Stata is not located in this default path, please provide the path **in the Master_script**:  

`stata_path <- ""`

Importat: do it **before running** the Master code 

----


## Workflow Summary

### 1. **Replication Setup** (`replic_setup.R`)
- Loads or installs required R packages
- Defines relative paths and Stata executable
- Ensures a clean environment before running

### 2. **Data Ingestion & Cleaning** (`Ingest_clean_IDB_api.R`)
- Downloads datasets from the IDB API
- Filters countries and years (2003–2022)
- Harmonizes variable names and structures
- Produces a unified `.dta` database

### 3. **Model Estimation** (`IDB_fe_model.do`)
- Loads the processed data
- Estimates a country fixed-effects model
- Exports the regression output to `/outputs`
  
----


## Dependencies 

### R packages 
(installed automatically by replic_setup.R if missing):
All dependencies are handled automatically by the setup script:
`httr`
`jsonlite`
`dplyr`
`haven`
`readr`
`ggplot2`
`janitor`
`purrr`
`data.table`

### Stata packages 
(the .do installs if missing):
`reghdfe`
`ftools`
`outreg2`

----


## Expected Outcomes:
Upon successful execution, the following folders and files will be created automatically under the working directory:

- **/IDB_Data_Analyst/data/**
  - **data/** `db_master_country_filter.dta` - Final merged dataset

- **/IDB_Data_Analyst/outputs/**
  - **tables/** `FE_model_results.txt` - Fixed-effects model summary (Stata)
  - **graphs/** - Directory for output graphs
  - Stata log file 

-----

## Repository Access
A full replication repository, including code, documentation, and results, is available on GitHub: `https://github.com/CamiMonzon/IDB_Data_Analyst`
