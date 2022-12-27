rm(list = ls())


path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/koyo_hoken_data_csv_17apr_20nov"

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


# 2020Nov以前
excel_csv <- function(exel_name,date, csv_name){
  data <- readxl::read_excel(exel_name,skip= 4) %>% dplyr::mutate(year_month = as.Date(date)) 
  data <- data[3:nrow(data),]
  data <- data %>% dplyr::rename("都道府県" = "...1", 
                                 "受給者実人数_計" = "受給者実人員" ,
                                 "受給者実人員_男" = "...3",
                                 "受給者実人員_女" = "...4",
                                 "支給金額_計" = "支給金額",
                                 "支給金額_男" = "...6",
                                 "支給金額_女" = "...7")
  data <-　data %>% na.omit() 
  data %>%  write_csv(csv_name)
}

excel_csv(exel_name = "2-05-r02-11.xlsx", date ="2020-11-01", csv_name ="koyo_hoken2020_11.csv")
excel_csv(exel_name = "2-05-r02-10.xlsx", date ="2020-10-01", csv_name ="koyo_hoken2020_10.csv")
excel_csv(exel_name = "2-05-r02-09.xlsx", date ="2020-09-01", csv_name ="koyo_hoken2020_09.csv")
excel_csv(exel_name = "2-05-r02-08.xlsx", date ="2020-08-01", csv_name ="koyo_hoken2020_08.csv")
excel_csv(exel_name = "2-05-r02-07.xlsx", date ="2020-07-01", csv_name ="koyo_hoken2020_07.csv")
excel_csv(exel_name = "2-05-r02-06.xlsx", date ="2020-06-01", csv_name ="koyo_hoken2020_06.csv")
excel_csv(exel_name = "2-05-r02-05.xlsx", date ="2020-05-01", csv_name ="koyo_hoken2020_05.csv")
excel_csv(exel_name = "2-05-r02-04.xlsx", date ="2020-04-01", csv_name ="koyo_hoken2020_04.csv")
excel_csv(exel_name = "2-05-r02-03.xls", date ="2020-03-01", csv_name ="koyo_hoken2020_03.csv")
excel_csv(exel_name = "2-05-r02-02.xls", date ="2020-02-01", csv_name ="koyo_hoken2020_02.csv")
excel_csv(exel_name = "2-05-r02-01.xls", date ="2020-01-01", csv_name ="koyo_hoken2020_01.csv")

excel_csv(exel_name = "2-05-r01-12.xls", date ="2019-12-01", csv_name ="koyo_hoken2019_12.csv")
excel_csv(exel_name = "2-05-r01-11.xls", date ="2019-11-01", csv_name ="koyo_hoken2019_11.csv")
excel_csv(exel_name = "2-05-r01-10.xls", date ="2019-10-01", csv_name ="koyo_hoken2019_10.csv")
excel_csv(exel_name = "2-05-r01-09.xls", date ="2019-09-01", csv_name ="koyo_hoken2019_09.csv")
excel_csv(exel_name = "2-05-r01-08.xls", date ="2019-08-01", csv_name ="koyo_hoken2019_08.csv")
excel_csv(exel_name = "2-05-r01-07.xls", date ="2019-07-01", csv_name ="koyo_hoken2019_07.csv")
excel_csv(exel_name = "2-05-r01-06.xls", date ="2019-06-01", csv_name ="koyo_hoken2019_06.csv")
excel_csv(exel_name = "2-05-r01-05.xls", date ="2019-05-01", csv_name ="koyo_hoken2019_05.csv")
excel_csv(exel_name = "2-05-h31-04.xls", date ="2019-04-01", csv_name ="koyo_hoken2019_04.csv")
excel_csv(exel_name = "2-05-h31-03.xls", date ="2019-03-01", csv_name ="koyo_hoken2019_03.csv")
excel_csv(exel_name = "2-05-h31-02.xls", date ="2019-02-01", csv_name ="koyo_hoken2019_02.csv")
excel_csv(exel_name = "2-05-h31-01.xls", date ="2019-01-01", csv_name ="koyo_hoken2019_01.csv")

excel_csv(exel_name = "2-05-h30-12.xls", date ="2018-12-01", csv_name ="koyo_hoken2018_12.csv")
excel_csv(exel_name = "2-05-h30-11.xls", date ="2018-11-01", csv_name ="koyo_hoken2018_11.csv")
excel_csv(exel_name = "2-05-h30-10.xls", date ="2018-10-01", csv_name ="koyo_hoken2018_10.csv")
excel_csv(exel_name = "2-05-h30-09.xls", date ="2018-09-01", csv_name ="koyo_hoken2018_09.csv")
excel_csv(exel_name = "2-05-h30-08.xls", date ="2018-08-01", csv_name ="koyo_hoken2018_08.csv")
excel_csv(exel_name = "2-05-h30-07.xls", date ="2018-07-01", csv_name ="koyo_hoken2018_07.csv")
excel_csv(exel_name = "2-05-h30-06.xls", date ="2018-06-01", csv_name ="koyo_hoken2018_06.csv")
excel_csv(exel_name = "2-05-h30-05.xls", date ="2018-05-01", csv_name ="koyo_hoken2018_05.csv")
excel_csv(exel_name = "2-05-h30-04.xls", date ="2018-04-01", csv_name ="koyo_hoken2018_04.csv")
excel_csv(exel_name = "2-05-h30-03.xls", date ="2018-03-01", csv_name ="koyo_hoken2018_03.csv")
excel_csv(exel_name = "2-05-h30-02.xls", date ="2018-02-01", csv_name ="koyo_hoken2018_02.csv")
excel_csv(exel_name = "2-05-h30-01.xls", date ="2018-01-01", csv_name ="koyo_hoken2018_01.csv")

excel_csv(exel_name = "2-05-h29-12.xls", date ="2017-12-01", csv_name ="koyo_hoken2017_12.csv")
excel_csv(exel_name = "2-05-h29-11.xls", date ="2017-11-01", csv_name ="koyo_hoken2017_11.csv")
excel_csv(exel_name = "2-05-h29-10.xls", date ="2017-10-01", csv_name ="koyo_hoken2017_10.csv")
excel_csv(exel_name = "2-05-h29-09.xls", date ="2017-09-01", csv_name ="koyo_hoken2017_09.csv")
excel_csv(exel_name = "2-05-h29-08.xls", date ="2017-08-01", csv_name ="koyo_hoken2017_08.csv")
excel_csv(exel_name = "2-05-h29-07.xls", date ="2017-07-01", csv_name ="koyo_hoken2017_07.csv")
excel_csv(exel_name = "2-05-h29-06.xls", date ="2017-06-01", csv_name ="koyo_hoken2017_06.csv")
excel_csv(exel_name = "2-05-h29-05.xls", date ="2017-05-01", csv_name ="koyo_hoken2017_05.csv")
excel_csv(exel_name = "2-05-h29-04.xls", date ="2017-04-01", csv_name ="koyo_hoken2017_04.csv")






