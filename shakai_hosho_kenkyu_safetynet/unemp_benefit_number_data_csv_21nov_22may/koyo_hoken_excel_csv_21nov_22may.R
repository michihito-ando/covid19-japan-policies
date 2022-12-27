rm(list = ls())

path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/unemp_benefit_number_data_csv_21nov_22may"

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
  data <- readxl::read_excel(exel_name, skip=2) %>% 
    dplyr::mutate(year_month = as.Date(date)) 
  data <- data[3:nrow(data),]
  data <- data %>% dplyr::rename("都道府県" = "〔 Ｂ　基本手当（延長給付を除く） 〕", 
                                 "受給者実人数_計" = "...2",
                                 "受給者実人員_男" = "...3",
                                 "受給者実人員_女" = "...4",
                                 "支給金額_計" = "...5",
                                 "支給金額_男" = "...6",
                                 "支給金額_女" = "...7")
  data <-　data %>% na.omit() 
  data %>%  write_csv(csv_name)
}

excel_csv(exel_name = "2-05-r03-11.xlsx", 
          date ="2021-11-01", 
          csv_name ="koyo_hoken2021_11.csv")


excel_csv(exel_name = "2-05-r03-12.xlsx", 
          date ="2021-12-01", 
          csv_name ="koyo_hoken2021_12.csv")

excel_csv(exel_name = "2-05-r04-01.xlsx", 
          date ="2022-01-01", 
          csv_name ="koyo_hoken2022_01.csv")

excel_csv(exel_name = "2-05-r04-02.xlsx", 
          date ="2022-02-01", 
          csv_name ="koyo_hoken2022_02.csv")

excel_csv(exel_name = "2-05-r04-03.xlsx", 
          date ="2022-03-01", 
          csv_name ="koyo_hoken2022_03.csv")

excel_csv(exel_name = "2-05-r04-04.xlsx", 
          date ="2022-04-01", 
          csv_name ="koyo_hoken2022_04.csv")

excel_csv(exel_name = "2-05-r04-05.xlsx", 
          date ="2022-05-01", 
          csv_name ="koyo_hoken2022_05.csv")

