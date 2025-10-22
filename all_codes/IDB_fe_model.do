
/*******************************************************************************

IDB Test: Data Analyst Position

Objetive: run a FE model with panel data. 
Data from: IDB API
Sample: LAC countries, for period 2003-2022

Created by: Camila Soledad Monzon
Last update: 10/21/2025

Note: code integrated into R master script
		  
*******************************************************************************/


* Setup ----
clear all
set more off
capture log close

ssc install reghdfe
ssc install ftools
ssc install outreg2

*Set relative paths ----
global data "`c(pwd)'/IDB_Data_Analyst/data"
global output "`c(pwd)'/IDB_Data_Analyst/outputs"


*Log ----
log using "${output}/Stata_log.log", replace


* Load dataset ----
use "${data}/db_master_country_filter.dta", clear


**Clean country-years missings values ----
drop if isoalpha3 == "BRA" & year == 2010
drop if isoalpha3 == "PRY" & year == 2019
drop if isoalpha3 == "PER" & year == 2005
drop if isoalpha3 == "BOL" & year == 2004
drop if isoalpha3 == "BOL" & year == 2010



**Setting FE model by country -------- 
encode isoalpha3 , gen(country_id)
xtset country_id year


*Labelling---- 
label variable hli_women_share "House Inc Women %"
label variable investment "Investment"
label variable gdp "GDP"
label variable unemployment_rate "Unemp. Rate"
label variable inflation_rate "Inflation Rate"
label variable consumption "Consumption"
label variable hh_female_head "HH Female Head"
label variable poverty_rate "Poverty Rate"
label variable working_age_share "Working Age %"
label variable female_population_share "Female Pop %"
label variable secondary_completion "Sec Completion"
label variable terciary_completion "Tert Completion"
label variable neet_rate "NEET Rate"
label variable hh_size "HH Size"
label variable export "Export"
label variable gdp_grw "GDP Growth"
label variable work_services "Work Services"
label variable work_industry "Work Industry"

local add "addtext(Year FE, Yes, Country FE, Yes)"



*---- ONLY MACRO VARS-----*

** 1. Reg solo factores macro (desempleo, gdp)
xtreg hli_women_share unemployment_rate gdp_grw i.year, fe cluster(country_id)
outreg2 using "${output}\tables\Results.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label replace


** 2. Reg solo factores macro (desempleo, gdp, X)
xtreg hli_women_share unemployment_rate gdp_grw export  i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append


** 3. Reg solo factores macro (desempleo, gdp, X, pobreza, inflation)
xtreg hli_women_share unemployment_rate gdp_grw export poverty_rate inflation_rate i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append


** 4. Reg solo factores macro (desempleo, gdp, X, pobreza, inflation, consumo, inversion)
xtreg hli_women_share unemployment_rate gdp_grw export poverty_rate inflation_rate consumption investment i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append



*---- MORE DETERMINANTS AS COVARIETES-----*

/*

hh_size
terciary_completion 
working_age_share 
neet_rate 
work_services
work_industry
female_population_share 
secondary_completion 
hh_female_head 
*/


** 1.1 Reg (desempleo, gdp) + ( hh_size terciary_completion working_age_share neet_rate work_services work_industry)
xtreg hli_women_share unemployment_rate gdp_grw hh_size terciary_completion working_age_share neet_rate work_services work_industry i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results_v2.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label replace


** 2.1 Reg (desempleo, gdp, X) + ( hh_size terciary_completion working_age_share neet_rate work_services work_industry)
xtreg hli_women_share unemployment_rate gdp_grw export hh_size terciary_completion working_age_share neet_rate work_services work_industry i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results_v2.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append


** 3.1 Reg (desempleo, gdp, X, pobreza, inflation) + ( hh_size terciary_completion working_age_share neet_rate work_services work_industry)
xtreg hli_women_share unemployment_rate gdp_grw export poverty_rate inflation_rate hh_size terciary_completion working_age_share neet_rate work_services work_industry i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results_v2.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append


** 4.1 Reg (desempleo, gdp, X, pobreza, inflation, consumo, inversion) + ( hh_size terciary_completion working_age_share neet_rate work_services work_industry)
xtreg hli_women_share unemployment_rate gdp_grw export poverty_rate inflation_rate consumption investment hh_size terciary_completion working_age_share neet_rate work_services work_industry i.year, fe cluster(country_id)
outreg2  using "${output}\tables\Results_v2.tex", drop(i.year) tex nocons tdec(2) sdec(2) rdec(2) auto(2) se `add' ctitle(Inc Women %) label append



capture log close
capture erase "`c(pwd)'/IDB_fe_model.log'"












