rm(list = ls())

setwd("/Users/masayawaki/Dropbox/GitHub/R_2021/COVID_monthly_data")

# packages
library(tidyverse)
##############################################################################
# データ読み込み・年月データの追加・csv書き出し

# Read from excel
region_code <- readxl::read_excel("region_code.xls")


setwd("./被保護者調査_世帯類型別/月次調査") 

  
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


excel_csv2015_2018 <- function(excel_name, year_input, csv_name){
  
  df <- readxl::read_excel(excel_name ,skip=4)

  df<- df[3:nrow(df),]
  
  df<- df %>% 
    dplyr::rename(local_government = "　",
                  households_receive_elderly ="高齢者世帯",
                  households_receive_singlemother = "母 子 世 帯",
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
    dplyr::mutate(local_government = stringr::str_replace(local_government, "　", ""),
                  local_government = stringr::str_replace(local_government, "　", ""),
                  local_government = stringr::str_replace(local_government, "　", ""),
                  local_government = stringr::str_replace(local_government, "　", ""),
                  local_government = stringr::str_replace(local_government, "　", ""),
                  local_government = stringr::str_replace(local_government, "県", ""),
                  local_government = stringr::str_replace(local_government,  "京都府", "京都"),
                  local_government = stringr::str_replace(local_government,  "大阪府", "大阪"),
                  local_government = stringr::str_replace(local_government, "東京都", "東京"))
  
  df <- df %>% 
    tidyr::drop_na()　#指定都市・中核都市の行を削除するため
  
  
  df <- df %>% 
    dplyr::left_join(region_code, by = "local_government")
  
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
    dplyr::mutate(year = year_input)
  
   df %>%
    write_csv(csv_name)
  
}

excel_csv2019_2020 <- function(excel_name, year_input, csv_name){
  
  df <- readxl::read_excel(excel_name,skip=6)
  
  df<- df[2:nrow(df),]
  
  df<- df %>% 
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
    dplyr::mutate(year = year_input)
  
  df %>%
    write_csv(csv_name)
}

excel_csv2015_2018(excel_name = "h27_hou0007.xls", 
          year_input  = 2015, 
          csv_name ="hihogo2015.csv")

excel_csv2015_2018(excel_name = "h28_hou0007.xlsx", 
          year_input  = 2016, 
          csv_name ="hihogo2016.csv")

excel_csv2015_2018(excel_name = "h29_hou0007.xlsx", 
          year_input  = 2017, 
          csv_name ="hihogo2017.csv")

excel_csv2015_2018(excel_name = "h30_hou0007.xlsx", 
          year_input  = 2018, 
          csv_name ="hihogo2018.csv")

excel_csv2019_2020(excel_name = "2019_hou0007.xlsx", 
          year_input  = 2019, 
          csv_name ="hihogo2019.csv")

excel_csv2019_2020(excel_name = "2020_hou0007.xlsx", 
          year_input  = 2020, 
          csv_name ="hihogo2020.csv")


