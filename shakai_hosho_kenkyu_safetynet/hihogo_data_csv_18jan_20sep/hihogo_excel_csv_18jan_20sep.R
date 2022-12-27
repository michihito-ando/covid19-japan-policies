rm(list = ls())

path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/hihogo_data_csv_18jan_20sep"
setwd(path)

# packages
library(tidyverse)
#library(readxl)

#####
# Rstudioで実行する場合
# path <- "monthly-data/Public_Assistance_Recipient/"
# setwd(path)

# Run Appする場合
path <- ""
##############################################################################
# データ読み込み・年月データの追加・上４行の削除・csv書き出し


hihogo2018_1 <- readxl::read_excel("2018_1.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-01-01")) 
hihogo2018_1[3:nrow( hihogo2018_1),] %>%  write_csv("hihogo2018_1.csv")

hihogo2018_2 <- readxl::read_excel("2018_2.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-02-01"))
hihogo2018_2[3:nrow( hihogo2018_2),] %>%  write_csv("hihogo2018_2.csv")

hihogo2018_3 <- readxl::read_excel("2018_3.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-03-01"))
hihogo2018_3[3:nrow( hihogo2018_3),] %>%  write_csv("hihogo2018_3.csv")

hihogo2018_4 <- readxl::read_excel("2018_4.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-04-01"))
hihogo2018_4[3:nrow( hihogo2018_4),] %>%  write_csv("hihogo2018_4.csv")

hihogo2018_5 <- readxl::read_excel("2018_5.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-05-01"))
hihogo2018_5[3:nrow( hihogo2018_5),] %>%  write_csv("hihogo2018_5.csv")

hihogo2018_6 <- readxl::read_excel("2018_6.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-06-01"))
hihogo2018_6[3:nrow( hihogo2018_6),] %>%  write_csv("hihogo2018_6.csv")

hihogo2018_7 <- readxl::read_excel("2018_7.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-07-01"))
hihogo2018_7[3:nrow( hihogo2018_7),] %>%  write_csv("hihogo2018_7.csv")

hihogo2018_8 <- readxl::read_excel("2018_8.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-08-01"))
hihogo2018_8[3:nrow( hihogo2018_8),] %>%  write_csv("hihogo2018_8.csv")

hihogo2018_9 <- readxl::read_excel("2018_9.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-09-01"))
hihogo2018_9[3:nrow( hihogo2018_9),] %>%  write_csv("hihogo2018_9.csv")

hihogo2018_10 <- readxl::read_excel("2018_10.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-10-01"))
hihogo2018_10[3:nrow( hihogo2018_10),] %>%  write_csv("hihogo2018_10.csv")

hihogo2018_11 <- readxl::read_excel("2018_11.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-11-01"))
hihogo2018_11[3:nrow( hihogo2018_11),] %>%  write_csv("hihogo2018_11.csv")

hihogo2018_12 <- readxl::read_excel("2018_12.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2018-12-01"))
hihogo2018_12[3:nrow( hihogo2018_12),] %>%  write_csv("hihogo2018_12.csv")



hihogo2019_1 <- readxl::read_excel("2019_1.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-01-01")) 
hihogo2019_1[3:nrow( hihogo2019_1),] %>%  write_csv("hihogo2019_1.csv")

hihogo2019_2 <- readxl::read_excel("2019_2.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-02-01"))
hihogo2019_2[3:nrow( hihogo2019_2),] %>%  write_csv("hihogo2019_2.csv")

hihogo2019_3 <- readxl::read_excel("2019_3.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-03-01"))
hihogo2019_3[3:nrow( hihogo2019_3),] %>%  write_csv("hihogo2019_3.csv")

hihogo2019_4 <- readxl::read_excel("2019_4.xls",skip=2)  %>%  dplyr::mutate(year_month = as.Date("2019-04-01"))
# ４月の数値データに空白が含まれており、その空白をなくす処理
for (i in 4:11) {
  hihogo2019_4[[i]] <- str_replace_all( hihogo2019_4[[i]]," ","")
}
hihogo2019_4[3:nrow( hihogo2019_4),] %>%  write_csv("hihogo2019_4.csv")

hihogo2019_5 <- readxl::read_excel("2019_5.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-05-01"))
hihogo2019_5[3:nrow( hihogo2019_5),] %>%  write_csv("hihogo2019_5.csv")

hihogo2019_6 <- readxl::read_excel("2019_6.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-06-01"))
hihogo2019_6[3:nrow( hihogo2019_6),] %>%  write_csv("hihogo2019_6.csv")

hihogo2019_7 <- readxl::read_excel("2019_7.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-07-01"))
hihogo2019_7[3:nrow( hihogo2019_7),] %>%  write_csv("hihogo2019_7.csv")

hihogo2019_8 <- readxl::read_excel("2019_8.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-08-01"))
hihogo2019_8[3:nrow( hihogo2019_8),] %>%  write_csv("hihogo2019_8.csv")

hihogo2019_9 <- readxl::read_excel("2019_9.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-09-01"))
hihogo2019_9[3:nrow( hihogo2019_9),] %>%  write_csv("hihogo2019_9.csv")

hihogo2019_10 <- readxl::read_excel("2019_10.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-10-01"))
hihogo2019_10[3:nrow( hihogo2019_10),] %>%  write_csv("hihogo2019_10.csv")

hihogo2019_11 <- readxl::read_excel("2019_11.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-11-01"))
hihogo2019_11[3:nrow( hihogo2019_11),] %>%  write_csv("hihogo2019_11.csv")

hihogo2019_12 <- readxl::read_excel("2019_12.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2019-12-01"))
hihogo2019_12[3:nrow( hihogo2019_12),] %>%  write_csv("hihogo2019_12.csv")

hihogo2020_1 <- readxl::read_excel("2020_1.xls",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-01-01"))
hihogo2020_1[3:nrow( hihogo2020_1),] %>%  write_csv("hihogo2020_1.csv")

hihogo2020_2 <- readxl::read_excel("2020_2.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-02-01"))
hihogo2020_2[3:nrow( hihogo2020_2),] %>%  write_csv("hihogo2020_2.csv")

hihogo2020_3 <- readxl::read_excel("2020_3.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-03-01"))
hihogo2020_3[3:nrow( hihogo2020_3),] %>%  write_csv("hihogo2020_3.csv")

hihogo2020_4 <- readxl::read_excel("2020_4.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-04-01"))
hihogo2020_4[3:nrow( hihogo2020_4),] %>%  write_csv("hihogo2020_4.csv")

hihogo2020_5 <- readxl::read_excel("2020_5.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-05-01"))
hihogo2020_5[3:nrow( hihogo2020_5),] %>%  write_csv("hihogo2020_5.csv")

hihogo2020_6 <- readxl::read_excel("2020_6.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-06-01"))
hihogo2020_6[3:nrow(hihogo2020_6),] %>%  write_csv("hihogo2020_6.csv")


hihogo2020_7 <- readxl::read_excel("2020_7.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-07-01"))
hihogo2020_7[3:nrow(hihogo2020_7),] %>%  write_csv("hihogo2020_7.csv")

hihogo2020_8 <- readxl::read_excel("2020_8.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-08-01"))
hihogo2020_8[3:nrow(hihogo2020_8),] %>%  write_csv("hihogo2020_8.csv")

hihogo2020_9 <- readxl::read_excel("2020_9.xlsx",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-09-01"))
hihogo2020_9[3:nrow(hihogo2020_9),] %>%  write_csv("hihogo2020_9.csv")




