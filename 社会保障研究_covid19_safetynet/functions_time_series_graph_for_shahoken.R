annotate_size <- 3
width_size <- 11
datebreaks <- c(as.Date("2019-01-01"), 
                as.Date("2019-04-01"), 
                as.Date("2019-07-01"), 
                as.Date("2019-10-01"),
                as.Date("2020-01-01"), 
                as.Date("2020-04-01"), 
                as.Date("2020-07-01"), 
                as.Date("2020-10-01"),
                as.Date("2021-01-01"), 
                as.Date("2021-04-01"), 
                as.Date("2021-07-01"), 
                as.Date("2021-10-01"),
                as.Date("2022-01-01"), 
                as.Date("2022-04-01"))

# グラフ関数
## 住居確保（論文用）
graph_jukyo <- function(outcome){
  g <- ggplot(df_koguchi_sogo_jukyo_zenkoku,  # Japan (zenkoku)
              aes_string(x = "date", 
                         y = outcome,
                         group = "id")) +
    
    geom_segment(aes(x=as.Date("2019-04-01"), 
                     xend= as.Date("2020-03-01"),
                     y=0.216, 
                     yend=0.216), 
                 linetype= "dotted") +
    
    geom_vline(aes(xintercept = as.Date("2020-01-01")),
               colour = "gray", 
               linetype="solid", 
               size = 1.5) +
    
    geom_line(color="black",
              size=1.5) +
    
    geom_line(data = df_koguchi_sogo_jukyo_okinawa, # Okinawa
              aes_string(x = "date",
                         y = outcome,
                         group = "id"),
              linetype = "dashed",
              size = 2) +
    
    
    geom_line(data = df_koguchi_sogo_jukyo_tokyo, # Tokyo
              aes_string(x = "date",
                         y =outcome,
                         group = "id")) +
    
    
    geom_line(data = df_koguchi_sogo_jukyo_not_main, # Other prefecture
              aes_string(x = "date",
                         y = outcome,
                         group = "id"), 
              alpha=0.3) +
    
    annotate(geom="text", x=as.Date("2020-07-01"), y = 70,
             label="東京", size= 3, hjust = 0, family = font_name) +
    annotate(geom="text", x=as.Date("2021-01-01"), y = 15,
             label="沖縄", size= 3, hjust = 0, family = font_name) +
    annotate(geom="text", x=as.Date("2021-05-15"), y = 4,
             label="全国", size= 3, hjust = 0, family = font_name) +
    scale_x_date(labels = scales::date_format("%Y/%m"), 
                 breaks=datebreaks,
                 limits = as.Date(c(min(as.Date(df_zenkoku$date)),
                                    max(as.Date("2021-06-01"))))) +
    theme_classic(base_family = font_name) +
    theme(legend.position = "none", 
          axis.text.x = element_text(angle = 90 , hjust=1)) +
    labs(x = "月日",
         y = "",title = "")
}

## 緊急小口・総合支援・住居確保

### 論文では住居確保にはgraph_jukyo()を使っている。
### もともと住居確保でもこれを使っていたため、この関数名になっている。

graph_koguchi_sogo_jukyo <- function(outcome){
  g <- ggplot(df_koguchi_sogo_jukyo_zenkoku,  # 全国グラフ
              aes_string(x = "date", 
                         y = outcome,
                         group = "id")) +
    
    geom_vline(aes(xintercept = as.Date("2020-01-01")),
               colour = "gray", 
               linetype="solid", size = 1.5) +
    
    geom_line(color="black",size=1.5) +
    
    geom_line(data = df_koguchi_sogo_jukyo_tokyo, # 東京グラフ
              aes_string(x = "date",
                         y =outcome,
                         group = "id")) +
    
    geom_line(data = df_koguchi_sogo_jukyo_okinawa, # 沖縄グラフ
              aes_string(x = "date",
                         y = outcome,
                         group = "id"),
              linetype = "dashed",
              size= 2) +
    
    geom_line(data = df_koguchi_sogo_jukyo_not_main, #その他都道府県グラフ
              aes_string(x = "date",
                         y = outcome,
                         group = "id"), 
              alpha=0.3) +
    
    theme_classic(base_family = font_name) +
    theme(legend.position = "none", 
          axis.text.x = element_text(angle = 90 , hjust=1)) +
    labs(x = "月日",
         y = "",title = "") + 
    
    ggrepel::geom_text_repel(
      data = subset(df_koguchi_sogo_jukyo_percapita, # これは何か？このdfでいいのか
                    date == max(date)),
      aes(label = prefec_kanji),
      nudge_x = 40,
      segment.alpha = 0,
      size = 4,
      family= font_name) +
    
    scale_x_date(labels = scales::date_format("%Y/%m"), breaks = datebreaks,
                 limits = as.Date(c(min(as.Date(df_zenkoku$date)),
                                    max(as.Date("2021-06-01"))))) 
  g
  
  # limits = as.Date(c(min(as.Date(df_koguchi_sogo_jukyo_zenkoku$date)),
  #                    max(as.Date("2022-07-01"))))
}


## 失業給付(全国 + 47都道府県)
graph_unemp_benefit <- function(outcome){
  g <- ggplot(df_zenkoku, # 全国グラフ => df_unemp_zenkokuに名前変更
              aes_string(x = "date", 
                         y = outcome,
                         group = "id")) +
    
    ylim(200,650) + 
    
    geom_vline(aes(xintercept = as.Date("2020-01-01")),
               colour = "gray", 
               linetype="solid", size = 1.5) +
    
    geom_line(color="black",size=1.5) +
    
    geom_line(data = df_tokyo,  #東京グラフ => df_unemp_tokyoにに名前変更
              aes_string(x = "date",
                         y =outcome,
                         group = "id")) +
    
    geom_line(data = df_okinawa,  #沖縄グラフ => df_unemp_tokyoにに名前変更
              aes_string(x = "date",
                         y = outcome,
                         group = "id"),
              linetype = "dashed",
              size=1.5) +
    
    geom_line(data = df_not_main, #その他都道府県グラフ => df_unemp_not_mainにに名前変更
              aes_string(x = "date",
                         y = outcome,
                         group = "id"), 
              alpha=0.3) +
    
    ggrepel::geom_text_repel(
      data = subset(df_main,  #これはなにか? df_mainでいいのか。また、df_unemp_mainに名前変更
                    date == max(date)),
      aes(label = prefec_kanji),
      min.segment.length =  1, 
      nudge_x = 40,
      segment.alpha = 0,
      size = 4,
      family= font_name) +
    scale_x_date(labels = scales::date_format("%Y/%m"), breaks = datebreaks,
                 limits = as.Date(c(min(as.Date(df_zenkoku$date)), # df_unemp_zenkokuに変更
                                    max(as.Date("2022-07-01"))))) + 
                 
    theme_classic(base_family = font_name) +
    theme(legend.position = "none", 
          axis.text.x = element_text(angle = 90 , hjust=1)) +
    labs(x = "月日",
         y = "",title = "") 
  g
  
}

## 生活保護
graph_hogo_persons <- function(outcome){
  g <- ggplot(df_hogo_zenkoku,  # 全国グラフ
              aes_string(x = "date", 
                         y = outcome,
                         group = "id")) +
    geom_vline(aes(xintercept = as.Date("2020-01-01")),
               colour = "gray", 
               linetype="solid", size = 1.5) +
    
    geom_line(color="black",size=1.5) +
    
    geom_line(data = df_hogo_tokyo, # 東京グラフ
              aes_string(x = "date",
                         y =outcome,
                         group = "id")) +
    
    geom_line(data = df_hogo_okinawa, # 沖縄グラフ
              aes_string(x = "date",
                         y = outcome,
                         group = "id"),
              linetype = "dashed",
              size=1.5) +
    
    geom_line(data = df_hogo_not_main, #その他の都道府県グラフ
              aes_string(x = "date",
                         y = outcome,
                         group = "id"), 
              alpha=0.3) +
    
    ggrepel::geom_text_repel( # 名前ラベル
      data = subset(df_hogo_main, # これは何か？df_hogo?mainでいいのか
                    date == max(date)),
      aes(label = prefec_kanji),
      nudge_x = 40,
      segment.alpha = 0,
      size = 3,
      family= font_name) +
    
    theme_classic(base_family = font_name) +
    theme(legend.position = "none", 
          axis.text.x = element_text(angle = 90 , hjust=1)) +
    labs(x = "月日",y = "",title = "") +
    
    scale_x_date(labels = scales::date_format("%Y/%m"), 
                 limits = as.Date(c(min(as.Date(df_hogo_main$date)),
                                    max(as.Date("2022-07-01")))), 
                 breaks=datebreaks)
  g
}

