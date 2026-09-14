# Load the data
library(tidyverse)

video_view <- read.csv("data/video_view.csv")
setwd()

# Exercise 1

video_features <- video_view %>% mutate(watch_rate_rank = rank(-watch_rate))

video_features <- video_view %>% mutate(reach_band = cut(impressions_n, breaks = c(0,9,41,230), labels = c("Low", "Medium", "High")))

video_features <- video_view %>% mutate(high_quality = avg_watch_share >= 0.40)

video_features <- video_view %>% distinct(video_id, .keep_all = TRUE)

write.csv(video_features, "temp/video_features.csv")

# Exercise 2



# Exercise 3



# Exercise 4



# Exercise 5
