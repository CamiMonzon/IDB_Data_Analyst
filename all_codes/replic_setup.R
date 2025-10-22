

# # ---- Package setup ----

required_packages <- c(
  "httr", "jsonlite", "dplyr", "haven", "readr",
  "ggplot2", "janitor", "purrr", "data.table"
)

# Detect any missing package
missing_packages <- required_packages[!(required_packages %in% installed.packages()[, "Package"])]

# Install them
if (length(missing_packages) > 0) {
  message("Installing missing packages: ", paste(missing_packages, collapse = ", "))
  install.packages(missing_packages)
}

#Load package
invisible(lapply(required_packages, library, character.only = TRUE))

message("✅ All packages are installed and loaded successfully!")



# ----  Folder structure ----
dirs <- c("IDB_Data_Analyst",                                                               #Level 1
          "IDB_Data_Analyst/data", "IDB_Data_Analyst/outputs",                              #Level 2
          "IDB_Data_Analyst/outputs/tables", "IDB_Data_Analyst/outputs/graphs")             #Level 3
sapply(dirs, dir.create, showWarnings = FALSE)



# ---- Detect Stata Path (or ask for input) ----

find_stata_path <- function() {
  sys <- Sys.info()[["sysname"]]
  
  if (sys == "Windows") {
    base_dirs <- c("C:/Program Files", "C:/Program Files (x86)")
    pattern <- "^Stata(.*)\\.exe$"
    
    for (base in base_dirs) {
      stata_dirs <- list.dirs(base, recursive = FALSE, full.names = TRUE)
      stata_dirs <- stata_dirs[grepl("Stata", stata_dirs, ignore.case = TRUE)]
      
      for (dir in stata_dirs) {
        files <- list.files(dir, pattern = pattern, full.names = TRUE)
        if (length(files) > 0) return(files[1])
      }
    }
    
  } else if (sys == "Darwin") { # macOS
    # LOOK INTO DEFAULT DIRECTORY
    base_dir <- "/Applications/Stata"
    
    if (dir.exists(base_dir)) {
      # CONSIDER ANY VERSION (StataBE.app, StataSE.app, StataMP.app, etc.)
      stata_apps <- list.dirs(base_dir, recursive = FALSE, full.names = TRUE)
      stata_apps <- stata_apps[grepl("\\.app$", stata_apps, ignore.case = TRUE)]
      
      for (app in stata_apps) {
        macos_path <- file.path(app, "Contents/MacOS")
        if (dir.exists(macos_path)) {
          files <- list.files(macos_path, pattern = "^Stata.*", full.names = TRUE, ignore.case = TRUE)
          if (length(files) > 0) return(files[1])
        }
      }
    }
    
    # if not succesfull try with system path
    stata_path <- Sys.which("stata")
    if (nzchar(stata_path)) return(stata_path)
    
    
  } else if (sys == "Linux") {
    stata_path <- Sys.which("stata")
    if (nzchar(stata_path)) return(stata_path)
  }
  
  return(NA)
}



stata_path <- find_stata_path()

# If Stata path not found, then user input
if (is.na(stata_path)){
  
  stata_path <- stata_input

}


