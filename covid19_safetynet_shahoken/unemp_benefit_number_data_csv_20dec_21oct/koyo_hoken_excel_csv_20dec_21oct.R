rm(list = ls())


path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/unemp_benefit_number_data_csv_20dec_21oct"

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
# データ読み込み・年月データの追加・上４行の削除・csv書き出し

# 2020Dec以降
excel_csv <- function(exel_name,date, csv_name){
  data <- readxl::read_excel(exel_name, skip=3) %>% dplyr::mutate(year_month = as.Date(date)) 
  data <- data[3:nrow(data),]
  data <- data %>% dplyr::rename("都道府県" = "...1", 
                                 "受給者実人数_計" = "受給者実人員...2",
                                 "受給者実人員_男" = "受給者実人員...3",
                                 "受給者実人員_女" = "受給者実人員...4",
                                 "支給金額_計" = "支給金額...5",
                                 "支給金額_男" = "支給金額...6",
                                 "支給金額_女" = "支給金額...7")
  data <-　data %>% na.omit() 
  data %>%  write_csv(csv_name)
}

excel_csv(exel_name = "2-05-r02-12.xlsx", 
          date ="2020-12-01", 
          csv_name ="koyo_hoken2020_12.csv")

excel_csv(exel_name = "2-05-r03-01.xlsx", 
          date ="2021-01-01", 
          csv_name ="koyo_hoken2021_01.csv")

excel_csv(exel_name = "2-05-r03-02.xlsx", 
          date ="2021-02-01", 
          csv_name ="koyo_hoken2021_02.csv")

excel_csv(exel_name = "2-05-r03-03.xlsx", 
          date ="2021-03-01", 
          csv_name ="koyo_hoken2021_03.csv")

excel_csv(exel_name = "2-05-r03-04.xlsx", 
          date ="2021-04-01", 
          csv_name ="koyo_hoken2021_04.csv")

excel_csv(exel_name = "2-05-r03-05.xlsx", 
          date ="2021-05-01", 
          csv_name ="koyo_hoken2021_05.csv")

excel_csv(exel_name = "2-05-r03-06.xlsx", 
          date ="2021-06-01", 
          csv_name ="koyo_hoken2021_06.csv")

excel_csv(exel_name = "2-05-r03-07.xlsx", 
          date ="2021-07-01", 
          csv_name ="koyo_hoken2021_07.csv")

excel_csv(exel_name = "2-05-r03-08.xlsx",
          date ="2021-08-01", 
          csv_name ="koyo_hoken2021_08.csv")

excel_csv(exel_name = "2-05-r03-09.xlsx", 
          date ="2021-09-01", 
          csv_name ="koyo_hoken2021_09.csv")

excel_csv(exel_name = "2-05-r03-10.xlsx", 
          date ="2021-10-01", 
          csv_name ="koyo_hoken2021_10.csv")
