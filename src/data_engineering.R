# Load the data
setwd("C:/Users/tessa/OneDrive/Master Marketing Analytics/dpreptutorial/dprep-week4/data")
library(tidyverse)


video_view <- read_csv("video_view.csv")
users <- read_csv("users.csv")
impressions <- read_csv("impressions.csv")
watch_events <- read_csv("watch_events.csv")
sessions <- read_csv("sessions.csv")

# Exercise 1

video_features <- video_view %>%
  mutate(
    watch_rate_rank = rank(-watch_rate),
    reach_band = case_when(
      impressions_n < 20 ~ "Low",
      impressions_n < 60 ~ "Medium",
      TRUE ~ "High"
    ),
    high_quality = avg_watch_share >= 0.40
  ) %>%
  distinct(video_id, .keep_all = TRUE) %>%
  arrange(watch_rate_rank)

write_csv(video_features, "temp/video_features.csv")

# Exercise 2

creator_summary <- video_features %>% group_by(creator_id) %>% summarise(videos_n = n(), impressions_total = sum(impressions_n),
              watched_total = sum(watched_n), avg_watch_rate = mean(watch_rate),
              median_watch_seconds = median(total_watch_seconds))

engagement_by_band <- video_features %>% group_by(reach_band) %>% summarise(videos_n = n(), avg_watch_rate = mean(watch_rate))

# Exercise 3



# Exercise 4



# Exercise 5
