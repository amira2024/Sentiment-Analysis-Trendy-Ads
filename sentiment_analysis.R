library(syuzhet)
library(dplyr)
library(highcharter)
library(RColorBrewer)


cols <- brewer.pal(10, "Set3")


all_trend_tt <- read.csv("all_trend_tt.csv")
all_trend_insta <- read.csv("all_trend_insta.csv")
all_norm_insta <- read.csv("all_norm_insta.csv")
all_norm_tt <- read.csv("all_norm_tt.csv")



Sentiment1 <- get_nrc_sentiment(all_trend_tt$text)
all_sent1 <- cbind(all_trend_tt, Sentiment1)


sent_agg1 <- all_sent1 %>%
  summarise(anger = mean(anger), 
            anticipation = mean(anticipation), 
            disgust = mean(disgust), 
            fear = mean(fear), 
            joy = mean(joy), 
            sadness = mean(sadness), 
            surprise = mean(surprise), 
            trust = mean(trust))

Sentiment2 <- get_nrc_sentiment(all_trend_insta$text)
all_sent2 <- cbind(all_trend_insta, Sentiment2)


sent_agg2 <- all_sent2 %>%
  summarise(anger = mean(anger), 
            anticipation = mean(anticipation), 
            disgust = mean(disgust), 
            fear = mean(fear), 
            joy = mean(joy), 
            sadness = mean(sadness), 
            surprise = mean(surprise), 
            trust = mean(trust))

Sentiment3 <- get_nrc_sentiment(all_norm_tt$text)
all_sent3 <- cbind(all_norm_tt, Sentiment3)


sent_agg3 <- all_sent3 %>%
  summarise(anger = mean(anger), 
            anticipation = mean(anticipation), 
            disgust = mean(disgust), 
            fear = mean(fear), 
            joy = mean(joy), 
            sadness = mean(sadness), 
            surprise = mean(surprise), 
            trust = mean(trust))

Sentiment4 <- get_nrc_sentiment(all_norm_insta$text)
all_sent4 <- cbind(all_norm_insta, Sentiment4)


sent_agg4 <- all_sent4 %>%
  summarise(anger = mean(anger), 
            anticipation = mean(anticipation), 
            disgust = mean(disgust), 
            fear = mean(fear), 
            joy = mean(joy), 
            sadness = mean(sadness), 
            surprise = mean(surprise), 
            trust = mean(trust))


barplot(colSums(Sentiment1),
        las = 2,
        col = cols,
        ylab = 'Count',
        main = 'NRC Sentiment Scores For Trendy TikTok Ads')

barplot(colSums(Sentiment2),
        las = 2,
        col = cols,
        ylab = 'Count',
        main = 'NRC Sentiment Scores Trendy Instagram Ads')

barplot(colSums(Sentiment3),
        las = 2,
        col = cols,
        ylab = 'Count',
        main = 'NRC Sentiment Scores Normal TikTok Ads')

barplot(colSums(Sentiment4),
        las = 2,
        col = cols,
        ylab = 'Count',
        main = 'NRC Sentiment Scores Normal Instagram Ads')



Sentiment1b <- get_sentiment(all_trend_tt$text, method = "bing")
Sentiment1b <- factor(Sentiment1b)

Sentiment2b <- get_sentiment(all_trend_insta$text, method = "bing")
Sentiment2b <- factor(Sentiment2b)

Sentiment3b <- get_sentiment(all_norm_tt$text, method = "bing")
Sentiment3b <- factor(Sentiment3b)

Sentiment4b <- get_sentiment(all_norm_insta$text, method = "bing")
Sentiment4b <- factor(Sentiment4b)


plot(Sentiment1b,
     las = 2,
     col = cols,
     ylab = 'Count',
     main = 'Bing Sentiment Scores Trendy TikTok Ads')

plot(Sentiment2b,
     las = 2,
     col = cols,
     ylab = 'Count',
     main = 'Bing Sentiment Scores Trendy Instagram Ads')

plot(Sentiment3b,
     las = 2,
     col = cols,
     ylab = 'Count',
     main = 'Bing Sentiment Scores Normal TikTok Ads')

plot(Sentiment4b,
     las = 2,
     col = cols,
     ylab = 'Count',
     main = 'Bing Sentiment Scores Normal Instagram Ads')

