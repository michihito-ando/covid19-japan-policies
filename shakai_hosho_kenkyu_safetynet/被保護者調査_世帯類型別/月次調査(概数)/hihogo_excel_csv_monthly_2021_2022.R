rm(list = ls())

setwd("/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data")

# packages
library(tidyverse)
##############################################################################
# データ読み込み・年月データの追加・csv書き出し

# Read from excel
region_code <- readxl::read_excel("region_code.xls")


setwd("./被保護者調査_世帯類型別/月次調査(概数)") 

  
# 変数名 変換
region_code <- region_code %>% 
  dplyr::rename("local_government" =   "市区町村名\n（漢字）",
                "prefec_kanji" = "都道府県名\n（漢字）") 

# いらない変数削除　(Ando移動)
region_code　<- region_code %>% 
  dplyr::select(-"団体コード",-"都道府県名\n（カナ）", -"市区町村名\n（カナ）")

# delete "都道府県"　（生保データに合わせる）(Ando移動)
region_code <- region_code %>%
  dplyr::mutate(prefec_kanji = stringr::str_replace(prefec_kanji, "県", ""),
                prefec_kanji = stringr::str_replace(prefec_kanji,  "京都府", "京都"),
                prefec_kanji = stringr::str_replace(prefec_kanji,  "大阪府", "大阪"),
                prefec_kanji = stringr::str_replace(prefec_kanji, "東京都", "東京"))

region_code　<- region_code　%>% 
  dplyr::mutate(local_government = dplyr::case_when(
    is.na(local_government) ~ prefec_kanji,
    TRUE ~ local_government
  ))

zenkoku <-  data.frame(prefec_kanji = "全国",
                       local_government= "全国")

region_code <- dplyr::bind_rows(region_code, zenkoku)

excel_csv2021_2022 <- function(excel_name, date_input, csv_name){

  df <- readxl::read_excel(excel_name ,skip=3, sheet = "8")

  df <- df[5:nrow(df)-2,]
  
  df <- df %>% 
    dplyr::rename(local_government = "...2",
                  households_receive_elderly ="高齢者世帯",
                  households_receive_singlemother = "母子世帯",
                  households_receive_disabled = "障害者世帯",
                  households_receive_sick = "傷病者世帯",
                  households_receive_others  = "その他の世帯") %>% 
    dplyr::select(local_government,
                  households_receive_elderly, 
                  households_receive_singlemother,
                  households_receive_disabled,
                  households_receive_sick,
                  households_receive_others) 
  
  df <- df %>%
    dplyr::mutate(local_government = stringr::str_replace(local_government, "県", ""),
                  local_government = stringr::str_replace(local_government,  "京都府", "京都"),
                  local_government = stringr::str_replace(local_government,  "大阪府", "大阪"),
                  local_government = stringr::str_replace(local_government, "東京都", "東京"))
  
  
  df <- df %>% 
    dplyr::left_join(region_code, by = "local_government")
  
  df[,2:6] <- lapply(df[,2:6], as.numeric)
  
  # Aggregate data within prefectures and month
  df <- df %>% 
    dplyr::group_by(prefec_kanji) %>%
    dplyr::summarise(households_receive_elderly = sum(households_receive_elderly),
                     households_receive_singlemother = sum(households_receive_singlemother),
                     households_receive_disabled = sum(households_receive_disabled),
                     households_receive_sick = sum(households_receive_sick),
                     households_receive_others = sum(households_receive_others)) %>% 
    dplyr::ungroup() 
  
  df <-  df %>% 
    dplyr::mutate(date = date_input)
  
   df %>%
    write_csv(csv_name)
  
}

excel_csv2021_2022(excel_name = "閲覧表（r3.04）.xlsx", 
          date_input ="2021-04-01", 
          csv_name ="hihogo2021_04.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.05）.xlsx", 
          date_input ="2021-05-01", 
          csv_name ="hihogo2021_05.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.06）.xlsx", 
          date_input ="2021-06-01", 
          csv_name ="hihogo2021_06.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.07）.xlsx", 
          date_input ="2021-07-01", 
          csv_name ="hihogo2021_07.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.08）.xlsx", 
          date_input ="2021-08-01", 
          csv_name ="hihogo2021_08.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.09）.xlsx", 
          date_input ="2021-09-01", 
          csv_name ="hihogo2021_09.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.10）.xlsx", 
          date_input ="2021-10-01", 
          csv_name ="hihogo2021_10.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.11）.xlsx", 
          date_input ="2021-11-01", 
          csv_name ="hihogo2021_11.csv")

excel_csv2021_2022(excel_name = "閲覧表（r3.12）.xlsx", 
          date_input ="2021-12-01", 
          csv_name ="hihogo2021_12.csv")

excel_csv2021_2022(excel_name = "閲覧表（r4.1）.xlsx", 
          date_input ="2022-01-01", 
          csv_name ="hihogo2022_01.csv")

excel_csv2021_2022(excel_name = "閲覧表（r4.2）.xlsx", 
          date_input ="2022-02-01", 
          csv_name ="hihogo2022_02.csv")

excel_csv2021_2022(excel_name = "閲覧表（r4.3）.xlsx", 
          date_input ="2022-03-01", 
          csv_name ="hihogo2022_03.csv")

excel_csv2021_2022(excel_name = "閲覧表（r4.4）.xlsx", 
          date_input ="2022-04-01", 
          csv_name ="hihogo2022_04.csv")

excel_csv2021_2022(excel_name = "閲覧表（r4.5）.xlsx", 
          date_input ="2022-05-01", 
          csv_name ="hihogo2022_05.csv")


