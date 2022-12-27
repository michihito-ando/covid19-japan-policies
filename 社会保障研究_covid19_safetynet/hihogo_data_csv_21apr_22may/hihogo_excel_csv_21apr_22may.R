rm(list = ls())

path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/hihogo_data_csv_21apr_22may"
setwd(path)

# packages
library(tidyverse)
#library(readxl)

#####
# Rstudioで実行する場合
# path <- "monthly-data/Public_Assistance_Recipient/"
# setwd(path)

# Run Appする場合
#path <- ""
##############################################################################
# データ読み込み・年月データの追加・csv書き出し

excel_csv <- function(excel_name,date, csv_name){
  
  data_persons <- readxl::read_excel(excel_name, 
                                     sheet = "7",
                                     skip=3) %>% 
    dplyr::mutate(year_month = as.Date(date)) 
  
  data_persons <- data_persons[4:nrow(data_persons),]
  data_persons <- data_persons %>% dplyr::rename("local_government" = "...2", 
                                 "persons_total" = "総数...4",
                                 "persons_receive" = "現に保護を受けたもの",
                                 "persons_suspend" = "保護停止中のもの")
  data_persons <- data_persons %>% dplyr::select(local_government, 
                                 persons_total,
                                 persons_receive,
                                 persons_suspend,
                                 year_month)
  
  data_persons$persons_suspend <- as.numeric(data_persons$persons_suspend)
  
  data_households <- readxl::read_excel(excel_name,
                                        sheet = "8", 
                                        skip=3) %>% 
    dplyr::mutate(year_month = as.Date(date)) 
  data_households <- data_households[3:nrow(data_households),]
  data_households <- data_households %>% dplyr::rename("local_government" = "...2", 
                                 "households_total" = "総数",
                                 "households_receive" = "現に保護を受けたもの",
                                 "households_suspend" = "保護停止中のもの",
                                 "households_start" = "...21",
                                 "households_end" = "...22")
  
  data_households <-　data_households %>% dplyr::select(local_government,
                                 households_total,
                                 households_receive, 
                                 households_suspend, 
                                 households_start, 
                                 households_end,
                                 year_month)
  
  
  data_households$households_suspend <- as.numeric(data_households$households_suspend)
  
  data <- data_households %>% left_join(data_persons, 
                                        by =c("local_government",
                                              "year_month"))
  
  #persons_suspend、households_suspendのNAを0に代入 2022Aug8 Waki
  data <- data %>% 
    tidyr::replace_na(list(persons_suspend = 0)) %>% 
    tidyr::replace_na(list(households_suspend = 0))
  
  data <-　data %>% na.omit() 
  
  
  data %>%  write_csv(csv_name)
}

  
excel_csv(excel_name = "閲覧表（r3.04）.xlsx", 
          date ="2021-04-01", 
          csv_name ="hihogo2021_04.csv")

excel_csv(excel_name = "閲覧表（r3.05）.xlsx", 
          date ="2021-05-01", 
          csv_name ="hihogo2021_05.csv")

excel_csv(excel_name = "閲覧表（r3.06）.xlsx", 
          date ="2021-06-01", 
          csv_name ="hihogo2021_06.csv")

excel_csv(excel_name = "閲覧表（r3.07）.xlsx", 
          date ="2021-07-01", 
          csv_name ="hihogo2021_07.csv")

excel_csv(excel_name = "閲覧表（r3.08）.xlsx", 
          date ="2021-08-01", 
          csv_name ="hihogo2021_08.csv")

excel_csv(excel_name = "閲覧表（r3.09）.xlsx", 
          date ="2021-09-01", 
          csv_name ="hihogo2021_09.csv")

excel_csv(excel_name = "閲覧表（r3.10）.xlsx", 
          date ="2021-10-01", 
          csv_name ="hihogo2021_10.csv")

excel_csv(excel_name = "閲覧表（r3.11）.xlsx", 
          date ="2021-11-01", 
          csv_name ="hihogo2021_11.csv")

excel_csv(excel_name = "閲覧表（r3.12）.xlsx", 
          date ="2021-12-01", 
          csv_name ="hihogo2021_12.csv")

excel_csv(excel_name = "閲覧表（r4.1）.xlsx", 
          date ="2022-01-01", 
          csv_name ="hihogo2022_01.csv")

excel_csv(excel_name = "閲覧表（r4.2）.xlsx", 
          date ="2022-02-01", 
          csv_name ="hihogo2022_02.csv")

excel_csv(excel_name = "閲覧表（r4.3）.xlsx", 
          date ="2022-03-01", 
          csv_name ="hihogo2022_03.csv")

excel_csv(excel_name = "閲覧表（r4.4）.xlsx", 
          date ="2022-04-01", 
          csv_name ="hihogo2022_04.csv")

excel_csv(excel_name = "閲覧表（r4.5）.xlsx", 
          date ="2022-05-01", 
          csv_name ="hihogo2022_05.csv")

