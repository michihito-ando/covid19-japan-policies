rm(list = ls())

path <- "/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data/hihogo_data_csv_20oct_21mar"
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

hihogo2020_10 <- readxl::read_excel("2020_10.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-10-01"))
hihogo2020_10[3:nrow(hihogo2020_10),] %>%  write_csv("hihogo2020_10.csv")

hihogo2020_11 <- readxl::read_excel("2020_11.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-11-01"))
hihogo2020_11[3:nrow(hihogo2020_11),] %>%  write_csv("hihogo2020_11.csv")

hihogo2020_12 <- readxl::read_excel("2020_12.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2020-12-01"))
hihogo2020_12[3:nrow(hihogo2020_12),] %>%  write_csv("hihogo2020_12.csv")

hihogo2021_1 <- readxl::read_excel("2021_1.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2021-01-01"))
hihogo2021_1[3:nrow(hihogo2021_1),] %>%  write_csv("hihogo2021_01.csv")

hihogo2021_2 <- readxl::read_excel("2021_2.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2021-02-01"))
hihogo2021_2[3:nrow(hihogo2021_2),] %>%  write_csv("hihogo2021_02.csv")

hihogo2021_3 <- readxl::read_excel("2021_3.xlsx", sheet = "統計表1",skip=2)  %>% dplyr::mutate(year_month = as.Date("2021-03-01"))
hihogo2021_3[3:nrow(hihogo2021_3),] %>%  write_csv("hihogo2021_03.csv")







