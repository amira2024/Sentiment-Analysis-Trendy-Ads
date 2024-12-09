library(rtweet)
library(dplyr)
library(syuzhet) 
library(instaR)

#input bearer token
auth <- rtweet_app()

#collect 1000 tweets from Chipotle's Twitter timeline
tweets <- get_timeline(c("ChipotleTweets"), n = 1000, token = auth)


#start nrc sentiment with the text from the tweets
Sentiment <- get_nrc_sentiment(tweets$text)
all_sent <- cbind(tweets, Sentiment)

#gathering and labeling all sentiment data from tweets
all_sent$date <- as.factor(all_sent$created_at)
sent_agg <- all_sent %>%
  group_by(date) %>%
  summarise(anger = mean(anger), 
            anticipation = mean(anticipation), 
            disgust = mean(disgust), 
            fear = mean(fear), 
            joy = mean(joy), 
            sadness = mean(sadness), 
            surprise = mean(surprise), 
            trust = mean(trust))

sent_agg <- sent_agg %>% pivot_longer(cols = -c(date), names_to = "variable", values_to = "value")
                                      
#compress dataframe into matrix                                       
timeline2 <- apply(timeline,2,as.character) 
tweets2 <- apply(tweets,2,as.character) 

#write csv file from matrix
write.csv(timeline2, "/Users/briannacountie/Downloads/timeline_m2.csv", row.names=FALSE)
write.csv(tweets2, "/Users/briannacountie/Downloads/tweets_m2.csv", row.names=FALSE)
