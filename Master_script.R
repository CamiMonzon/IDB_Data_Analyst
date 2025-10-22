
remove(list = ls())

#Declare your Stata Path here if:
#A) Stata version is older than 17
#B) Stata is not installed in the path by default  (see README)
stata_input <- ""


#Set relatives paths:
"%+%" <- function(x,y) paste(x,y,sep = "")      
data_dir <- getwd() %+% "/IDB_Data_Analyst/data"
output_dir <- getwd() %+% "/IDB_Data_Analyst/outputs"
codes_dir <- getwd() %+% "/all_codes"


# ---- 0. Replication setup ----
source(codes_dir %+% "/replic_setup.R")


# ---- 1. Ingest & clean (R) ----
source(codes_dir %+% "/Ingest_clean_IDB_api.R")


# ---- 2. Analisys & Model (Stata) ----
system2(stata_path, args = c("-b", "do", codes_dir %+% "/IDB_fe_model.do"))
unlink(getwd() %+% "/IDB_fe_model.log")