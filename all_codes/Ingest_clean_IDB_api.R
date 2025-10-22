

#--- 1) INGEST DATA ----

base_url <- "https://data.iadb.org/api/action/datastore_search"


#--- 1.1 Percentage of household labor Income contributed by women (SILAC) ----

# ID del dataset: 
resource_id <- "4f63fdb6-a974-4aa5-9cf0-fd4ff96b46fc"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_li_women <- GET(base_url, 
                    query = list(
                      resource_id = resource_id ,
                      filters = filtros,
                      limit = 15000
                    ))

db_li_women <- fromJSON(content(get_li_women, as = "text"))
db_li_women <- db_li_women$result$records


#--- 1.2 Total investment (SILAC)----

# ID del dataset: 
resource_id <- "edb8a62b-1f1d-496f-ba3b-055f315a9cbc"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_investment <- GET(base_url, 
                      query = list(
                        resource_id = resource_id,
                        filters = filtros,
                        limit = 15000
                      ))

db_investment <- fromJSON(content(get_investment, as = "text"))
db_investment <- db_investment$result$records

#--- 1.3 GDP per capita in constant (2018) US$ (SILAC)----

# ID del dataset: 
resource_id <- "fca5c37f-2a43-4468-9b6a-9ef0753847bb"

get_gdp_pc <- GET(base_url, 
                  query = list(
                    resource_id = resource_id ,
                    limit = 15000
                  ))

db_gdp_pc <- fromJSON(content(get_gdp_pc, as = "text"))
db_gdp_pc <- db_gdp_pc$result$records

#--- 1.4 GDP (constant prices, millions of LCU) (LMW)----

# ID del dataset: 
resource_id <- "340633a6-572c-4055-b68f-77538f48a91b"

filtros <- toJSON(list(
  frequency = "Annual"),
  auto_unbox = TRUE)

get_gdp <- GET(base_url, 
               query = list(
                 resource_id = resource_id ,
                 filters = filtros,
                 limit = 15000
               ))

db_gdp <- fromJSON(content(get_gdp, as = "text"))
db_gdp <- db_gdp$result$records

table(db_gdp$isoalpha3)

#--- 1.5 Percentage of unemployed population (SILAC)----

# ID del dataset: 
resource_id <- "1be74900-f2b6-48e7-a8b1-d4a104d4c184"

# filters for call
filtros <- toJSON(list(
  quintile = "Total",
  area = "Total",
  age = "Total",
  migration = "Total",
  ethnicity = "Total",
  disability = "Total",
  sex = "Total"),
  auto_unbox = TRUE)

get_unemployment <- GET(base_url, 
                        query = list(
                          resource_id = resource_id ,
                          filters = filtros,
                          limit = 15000
                        ))

db_unemployment<- fromJSON(content(get_unemployment, as = "text"))
db_unemployment <- db_unemployment$result$records

table(db_unemployment$isoalpha3)

#--- 1.6 CPI (period average inflation, %) (LMW)----

# ID del dataset: 
resource_id <- "e7dd2139-ee7e-4555-b043-4a0ee9101a33"

filtros <- toJSON(list(
  frequency = "Annual"),
  auto_unbox = TRUE)

get_inflation <- GET(base_url, 
                     query = list(
                       resource_id = resource_id ,
                       filters = filtros,
                       limit = 15000
                     ))

db_inflation <- fromJSON(content(get_inflation, as = "text"))
db_inflation <- db_inflation$result$records

table(db_inflation$isoalpha3)

#--- 1.7 Consumption (constant prices, millions of LCU) (LMW)----

# ID del dataset: 
resource_id <- "376c75e2-3198-438b-b58c-d6ccbafd7e24"

filtros <- toJSON(list(
  frequency = "Annual"),
  auto_unbox = TRUE)

get_consumtion <- GET(base_url, 
                      query = list(
                        resource_id = resource_id ,
                        filters = filtros,
                        limit = 15000
                      ))

db_consumtion <- fromJSON(content(get_consumtion, as = "text"))
db_consumtion <- db_consumtion$result$records

table(db_consumtion$isoalpha3)

#--- 1.8 Percentage of households with female economic heads (SILAC)----

# ID del dataset: 
resource_id <- "58fd7470-4755-4a38-8dab-053a59c4fcb6"

# filters for call
filtros <- toJSON(list(
  quintile = "Total",
  area = "Total",
  migration = "Total",
  ethnicity = "Total",
  disability = "Total",
  sex = "Total"),
  auto_unbox = TRUE)

get_hh_women <- GET(base_url, 
                    query = list(
                      resource_id = resource_id ,
                      filters = filtros,
                      limit = 15000
                    ))

db_hh_women <- fromJSON(content(get_hh_women, as = "text"))
db_hh_women <- db_hh_women$result$records

#--- 1.9 Percentage of the population in poverty (SILAC)----

resource_id <- "977a6a55-ed0d-4621-9513-69b33d9b649c"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_poverty <- GET(base_url, 
                   query = list(
                     resource_id = resource_id ,
                     filters = filtros,
                     limit = 15000
                   ))

db_poverty <- fromJSON(content(get_poverty, as = "text"))
db_poverty<- db_poverty$result$records

table(db_poverty$isoalpha3)

#--- 1.10  Percentage of population in working age (SILAC)----

resource_id <- "e1802454-914d-453f-99bf-2a841e83087e"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_workage <- GET(base_url, 
                   query = list(
                     resource_id = resource_id ,
                     filters = filtros,
                     limit = 15000
                   ))

db_workage <- fromJSON(content(get_workage, as = "text"))
db_workage <- db_workage$result$records

table(db_workage$isoalpha3)

#--- 1.11  Percentage of women (SILAC)----

resource_id <- "64539735-220a-43a4-9bd9-4910746800e1"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_women_pop <- GET(base_url, 
                     query = list(
                       resource_id = resource_id ,
                       filters = filtros,
                       limit = 15000
                     ))

db_women_pop <- fromJSON(content(get_women_pop, as = "text"))
db_women_pop <- db_women_pop$result$records

table(db_women_pop$isoalpha3)

#--- 1.12 Completion rate in secondary education  (SILAC)----

resource_id <- "f1345828-923e-4b76-8bcc-cd4eae971877"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_secondary <- GET(base_url, 
                     query = list(
                       resource_id = resource_id ,
                       filters = filtros,
                       limit = 15000
                     ))

db_secondary <- fromJSON(content(get_secondary, as = "text"))
db_secondary <- db_secondary$result$records

table(db_secondary$isoalpha3)

#--- 1.13 Completion rate in terciary education  (SILAC)----

resource_id <-  "3ba96558-14c2-4109-af56-f23c4177c6d3"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_terciary <- GET(base_url, 
                    query = list(
                      resource_id = resource_id ,
                      filters = filtros,
                      limit = 15000
                    ))

db_terciary <- fromJSON(content(get_terciary, as = "text"))
db_terciary <- db_terciary$result$records

table(db_terciary$isoalpha3)

#--- 1.14 Percentage of young people between 15 and 24 years old who are "Not in Employment, Education or Training" (NEET)   (SILAC)----

resource_id <- "a5098e58-a052-4ae2-a9f1-b679e5b573fc"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_nini <- GET(base_url, 
                query = list(
                  resource_id = resource_id ,
                  filters = filtros,
                  limit = 15000
                ))

db_nini <- fromJSON(content(get_nini, as = "text"))
db_nini <- db_nini$result$records

table(db_nini$isoalpha3)


#--- 1.15 Household size  (SILAC)----

resource_id <- "a32bcb74-74b2-45e4-acb0-9aeba83ed342"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_hh_size <- GET(base_url, 
                   query = list(
                     resource_id = resource_id ,
                     filters = filtros,
                     limit = 15000
                   ))

db_hh_size  <- fromJSON(content(get_hh_size , as = "text"))
db_hh_size  <- db_hh_size $result$records


#--- 1.16 Net exports (LMW) ----

resource_id <- "7fe3cdfd-193e-4c50-a202-4041497fc353"

filtros <- toJSON(list(
  frequency = "Annual"),
  auto_unbox = TRUE)

get_export <- GET(base_url, 
                  query = list(
                    resource_id = resource_id ,
                    filters = filtros,
                    limit = 15000
                  ))

db_export <- fromJSON(content(get_export, as = "text"))
db_export <- db_export$result$records

#--- 1.17 GDP (constant prices, year on year growth, %) (LMW) ----

resource_id <- "05f76b06-e30f-4368-9459-4f1af9f7dcfd"

filtros <- toJSON(list(
  frequency = "Annual"),
  auto_unbox = TRUE)

get_gdp_grw <- GET(base_url, 
                   query = list(
                     resource_id = resource_id ,
                     filters = filtros,
                     limit = 15000
                   ))

db_gdp_grw  <- fromJSON(content(get_gdp_grw , as = "text"))
db_gdp_grw  <- db_gdp_grw$result$records


#--- 1.18 Percentage of workers in the commerce, restaurant, or hotel sector (SILAC) ----

resource_id <- "148bfdbe-2d2f-4f3d-81af-1579c0961e87"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_workers_ss <- GET(base_url, 
                      query = list(
                        resource_id = resource_id ,
                        filters = filtros,
                        limit = 15000
                      ))

db_workers_ss  <- fromJSON(content(get_workers_ss , as = "text"))
db_workers_ss <- db_workers_ss$result$records


#--- 1.19 Percentage of employed workers in the industrial sector (SILAC) ----

resource_id <- "24fae4dc-8d8d-4f71-8d31-ee6e3c185434"

# filters for call
filtros <- toJSON(list(
  area = "Total",
  quintile = "Total",
  sex = "Total",
  education_level = "Total",
  age = "Total",
  ethnicity = "Total",
  migration = "Total",
  disability = "Total"),
  auto_unbox = TRUE)

get_workers_ind <- GET(base_url, 
                       query = list(
                         resource_id = resource_id ,
                         filters = filtros,
                         limit = 15000
                       ))

db_workers_ind  <- fromJSON(content(get_workers_ind , as = "text"))
db_workers_ind <- db_workers_ind$result$records



#--- 2) CLEAN & PREPARE DATA ----

prep_df <- function(df, varname) {
  df <- janitor::clean_names(df)
  
  # Homogeneizar nombre del año
  if ("period" %in% names(df)) {
    df <- df %>% rename(year = period)
  } else if ("year" %in% names(df)) {
    df <- df %>% rename(year = year)
  }
  
  # Limpiar y dejar solo las variables relevantes
  df %>%
    mutate(
      year = as.numeric(year),
      value = as.numeric(value)
    ) %>%
    filter(as.numeric(year) >= 2003 & as.numeric(year) <= 2022) %>% 
    
    filter(!(year %in% as.numeric(1:12))) %>% 
    select(isoalpha3, year, value) %>%
    rename(!!varname := value)
}


#Aply function to all datasets
df_li_women     <- prep_df(db_li_women,     "hli_women_share")
df_investment   <- prep_df(db_investment,   "investment")
df_gdp_pc       <- prep_df(db_gdp_pc,       "gdp_pc")
df_gdp          <- prep_df(db_gdp,          "gdp")
df_unemployment <- prep_df(db_unemployment, "unemployment_rate")
df_inflation    <- prep_df(db_inflation,    "inflation_rate")
df_consumtion   <- prep_df(db_consumtion,   "consumption")
df_hh_women     <- prep_df(db_hh_women,     "hh_female_head")
df_poverty      <- prep_df(db_poverty,      "poverty_rate")
df_workage      <- prep_df(db_workage,      "working_age_share")
df_women_pop    <- prep_df(db_women_pop,    "female_population_share")
df_secondary    <- prep_df(db_secondary,    "secondary_completion")
df_terciary     <- prep_df(db_terciary,     "terciary_completion")
df_nini         <- prep_df(db_nini,         "neet_rate")
df_hh_size      <- prep_df(db_hh_size,      "hh_size")
df_export       <- prep_df(db_export,       "export")
df_gdp_grw      <- prep_df(db_gdp_grw,      "gdp_grw")
df_workers_ss   <- prep_df(db_workers_ss,   "work_services")
df_workers_ind  <- prep_df(db_workers_ind,  "work_industry")


#Remove all db datasets
rm(list = ls(pattern = "^db_"))

# lista de todos los df preparados
lista_dfs <- list(
  df_li_women, 
  df_investment, 
  df_gdp,
  df_unemployment, 
  df_inflation,
  df_consumtion, 
  df_hh_women,
  df_poverty, 
  df_workage,
  df_women_pop, 
  df_secondary, 
  df_terciary,
  df_nini,
  df_hh_size,
  df_export,
  df_gdp_grw,
  df_workers_ss,
  df_workers_ind
) 

# unir de a poco
tmp1 <- reduce(lista_dfs[1:6], full_join, by = c("isoalpha3", "year"))
tmp2 <- reduce(lista_dfs[7:12], full_join, by = c("isoalpha3", "year"))
tmp3 <- reduce(lista_dfs[13:18], full_join, by = c("isoalpha3", "year"))

# unir los 3 finales
db_master <- reduce(list(tmp1, tmp2, tmp3), full_join, by = c("isoalpha3", "year"))


##Limpieza de paises

#helpfull to descide wich units drop
aux_db_master <- db_master %>% group_by(isoalpha3) %>% summarise(min_y = min(year),
                                                                 max_y = max(year))

#not countrys
db_master <- db_master %>% filter(isoalpha3!= "Global" & isoalpha3!="OECD" & isoalpha3!="LAC")

#countris with missings value accross variables
db_master <- db_master %>% filter(
  isoalpha3!="BHS" & isoalpha3!="BRB" & 
    isoalpha3!="GUY" &  isoalpha3!="HTI" & 
    isoalpha3!="JAM" & isoalpha3!="DOM" & isoalpha3!="DMA" &
    isoalpha3!="TTO" & isoalpha3!="ATG" & isoalpha3!="GRD" & isoalpha3!="PRI" &
    isoalpha3!="SUR" &  isoalpha3!="PAN" &  isoalpha3!="KNA" & isoalpha3!="LCA" & 
    isoalpha3!="VCT" & isoalpha3!="VEN" & isoalpha3!="BLZ" &
    isoalpha3!="GTM"  & isoalpha3!="NIC" &  isoalpha3!="HND" )

# missing values in outcome
db_master <- db_master %>% filter(
  isoalpha3!="CHL" & isoalpha3!="MEX")

#Save dataset
write_dta(db_master, data_dir %+% "/db_master_country_filter.dta")


#--- 3) GRAPH----

# Graph lines HLI data

li_women <- df_li_women %>% filter(
  isoalpha3!="BHS" & isoalpha3!="BRB" & 
    isoalpha3!="GUY" &  isoalpha3!="HTI" & 
    isoalpha3!="JAM" & isoalpha3!="DOM" & isoalpha3!="DMA" &
    isoalpha3!="TTO" & isoalpha3!="ATG" & isoalpha3!="GRD" & 
    isoalpha3!="PRI" & isoalpha3!="SUR" &  isoalpha3!="PAN" &  
    isoalpha3!="KNA" & isoalpha3!="LCA" & isoalpha3!="VCT" & 
    isoalpha3!="VEN" & isoalpha3!="BLZ" & isoalpha3!="GTM" & 
    isoalpha3!="NIC" &  isoalpha3!="HND" & isoalpha3!="CHL" & isoalpha3!="MEX")


li_women <- li_women %>% group_by(year) %>% mutate(average = mean(hli_women_share))
li_women <- li_women %>%  rename(value = hli_women_share )


df_avg <- li_women%>%
  distinct(year, average) %>%              # mantener solo año y su promedio
  mutate(
    isoalpha3 = "Average",                  # nombre del "país" promedio
    value = average                        # renombrar valor
  ) %>%
  select(isoalpha3, year, value)

# Unir con la base original
li_women <- li_women %>%
  select(isoalpha3, year, value) %>%         # mantener formato limpio
  bind_rows(df_avg)                          # agregar filas de "AVG"

##Graph 1. HLI evolution
graph1 <- ggplot(li_women,
                 aes(x = year, y = value, color = isoalpha3, group = isoalpha3 )) +
  geom_line(linewidth = 1) +
  geom_point(size = 1.5) +
  scale_color_manual(
    values = c("Average" = "black",       # línea negra para el promedio
               setNames(rep("grey80", length(unique(li_women$isoalpha3)) - 1),
                        unique(li_women$isoalpha3)[unique(li_women$isoalpha3) != "Average"]))
  ) +
  labs(
    title = "Percentage of Household labor income contributed by women. Evolution",
    x = "year", y = "") +
  scale_x_continuous(breaks = seq(min(li_women$year), max(li_women$year), by = 1)) +
  theme_classic() + theme(legend.position = "none")

#Save graph
ggsave(
  filename = output_dir %+% "/graphs/HLI_evolution.png",
  plot = graph1,
  width = 10,          # ancho en pulgadas
  height = 6,          # alto en pulgadas
  dpi = 300            # resolución (ideal para informes o publicaciones)
)


rm(list = ls(pattern = "^df_"))
rm(list = ls(pattern = "^tmp"))
rm(list = ls(pattern = "^aux_"))
rm(list = ls(pattern = "^get_"))
