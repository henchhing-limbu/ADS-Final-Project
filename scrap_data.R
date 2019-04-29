library(dplyr)
library(rvest)
library(ggplot2)

URL <- "http://www.howstat.com/cricket/statistics/players/PlayerCountryList.asp?Country="
countries <- c('AUS', 'IND', 'SAF', 'ENG', 'WIN', 'PAK', 'NZL', 'SRL')
urls <- c()

for (country in countries) {
  urls <- c(urls, paste(URL,country,sep=""))
}
print(urls)
print(length(urls))

aus_url <- paste(URL, countries[1], sep="")
ind_url <- paste(URL, countries[2], sep="")
saf_url <- paste(URL, countries[3], sep="")
eng_url <- paste(URL, countries[4], sep="")
win_url <- paste(URL, countries[5], sep="")
pak_url <- paste(URL, countries[6], sep="")
nzl_url <- paste(URL, countries[7], sep="")
srl_url <- paste(URL, countries[8], sep="")

# australia data
nodes <- read_html(aus_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
aus_test_df <- df[,1:6][-c(1,2),]
colnames(aus_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
rownames(aus_test_df) <- 1:nrow(aus_test_df)
aus_test_df[,2:6] <- sapply(aus_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
aus_test_df <- aus_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# india data
nodes <- read_html(ind_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
ind_test_df <- df[,1:6]
ind_test_df <- ind_test_df[-c(1,2),]
colnames(ind_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(ind_test_df) <- 1:nrow(ind_test_df)
ind_test_df[,2:6] <- sapply(ind_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
ind_test_df <- ind_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# south africa data
nodes <- read_html(saf_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
saf_test_df <- df[,1:6]
saf_test_df <- saf_test_df[-c(1,2),]
colnames(saf_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(saf_test_df) <- 1:nrow(saf_test_df)
saf_test_df[,2:6] <- sapply(saf_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
saf_test_df <- saf_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# england data
nodes <- read_html(eng_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
eng_test_df <- df[,1:6]
eng_test_df <- eng_test_df[-c(1,2),]
colnames(eng_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(eng_test_df) <- 1:nrow(eng_test_df)
eng_test_df[,2:6] <- sapply(eng_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
eng_test_df <- eng_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# west indies data
nodes <- read_html(win_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
win_test_df <- df[,1:6]
win_test_df <- win_test_df[-c(1,2),]
colnames(win_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(win_test_df) <- 1:nrow(win_test_df)
win_test_df[,2:6] <- sapply(win_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
win_test_df <- win_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# pakistan data
nodes <- read_html(pak_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
pak_test_df <- df[,1:6]
pak_test_df <- pak_test_df[-c(1,2),]
colnames(pak_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(pak_test_df) <- 1:nrow(pak_test_df)
pak_test_df[,2:6] <- sapply(pak_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
pak_test_df <- pak_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# New Zealand data
nodes <- read_html(nzl_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
nzl_test_df <- df[,1:6]
nzl_test_df <- nzl_test_df[-c(1,2),]
colnames(nzl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(nzl_test_df) <- 1:nrow(nzl_test_df)
nzl_test_df[,2:6] <- sapply(nzl_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
nzl_test_df <- nzl_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# Sri Lanka data
nodes <- read_html(srl_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA
srl_test_df <- df[,1:6]
srl_test_df <- srl_test_df[-c(1,2),]
colnames(srl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(srl_test_df) <- 1:nrow(srl_test_df)
srl_test_df[,2:6] <- sapply(srl_test_df[, 2:6], as.numeric)
# Cretaing new columns wickets per game
srl_test_df <- srl_test_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)

# Combining dataframes
combined_df <- rbind(aus_test_df, ind_test_df, saf_test_df, pak_test_df, eng_test_df, win_test_df, 
                     srl_test_df, nzl_test_df)
# Creating a new column wkts per game
combined_df <- combined_df %>% mutate(`Wkts per game`=`Wkts`/`Matches`)



# SUMMRAIES
# Overall
summary(combined_df)
# Australia
summary(aus_test_df)
# India
summary(ind_test_df)
# South Africa
summary(saf_test_df)
# England
summary(eng_test_df)
# West Indies
summary(win_test_df)
# Pakistan
summary(pak_test_df)
# New Zealand
summary(nzl_test_df)
# Sri Lanka
summary(srl_test_df)

# BAT AVG VS MATCHES
# Overall
ggplot(na.omit(combined_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# Australia
ggplot(na.omit(aus_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# India
ggplot(na.omit(ind_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# South Africa
ggplot(na.omit(saf_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# England
ggplot(na.omit(eng_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# West Indies
ggplot(na.omit(win_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# Pakistan
ggplot(na.omit(pak_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# New Zealand
ggplot(na.omit(nzl_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)
# Sri Lanka
ggplot(na.omit(srl_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 100)

# BOWL AVG VS MATCHES
# Overall
ggplot(na.omit(combined_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# Australia
ggplot(na.omit(aus_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# India
ggplot(na.omit(ind_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# South Africa
ggplot(na.omit(saf_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# England
ggplot(na.omit(eng_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# West Indies
ggplot(na.omit(win_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# Pakistan
ggplot(na.omit(pak_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# New Zealand
ggplot(na.omit(nzl_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)
# Sri Lanka
ggplot(na.omit(srl_test_df), aes(x=Matches, y=`Bowl Avg`)) + geom_point() + xlim(0, 200) + ylim(0, 300)

# WICKETS PER GAME
# Overall
ggplot(na.omit(combined_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 125)
# Australia
ggplot(na.omit(aus_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# India
ggplot(na.omit(ind_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# South Africa
ggplot(na.omit(saf_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# England
ggplot(na.omit(eng_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# West Indies
ggplot(na.omit(win_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# Pakistan
ggplot(na.omit(pak_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# New Zealand
ggplot(na.omit(nzl_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)
# Sri Lanka
ggplot(na.omit(srl_test_df), aes(x=`Wkts per game`)) + geom_histogram(color='black', fill='white') + xlim(0, 7) + ylim(0, 35)

# Histograms for overall
ggplot(na.omit(combined_df), aes(x=`Bat Avg`)) + geom_histogram(color='black', fill='white')
ggplot(na.omit(combined_df), aes(x=`Bowl Avg`)) + geom_histogram(color='black', fill='white')
ggplot(na.omit(combined_df), aes(x=`Wkts`)) + geom_histogram(color='black', fill='white')

# NULL HYPOTHESISES
# Mean Batting Avg = 18.
combined_bat_avg <- unlist(na.omit(combined_df[, "Bat Avg"]))
# bat_avg_sample <- sample(combined_bat_avg, 200, replace=TRUE) %>% data.frame(`BatAvg`=.)
ggplot(bat_avg_sample, aes(x=`BatAvg`)) + geom_histogram(color='black', fill='white')
# saveRDS(bat_avg_sample, file = "bat_avg.rds")
# readRDS(file = "bat_avg.rds")

# Mean Bowling Avg = 32.
combined_bowl_avg <- unlist(na.omit(combined_df[, "Bowl Avg"]))
# bowl_avg_sample <- sample(combined_bowl_avg, 200, replace=TRUE) %>% data.frame(`BowlAvg`=.)
ggplot(bowl_avg_sample, aes(x=`BowlAvg`)) + geom_histogram(color='black', fill='white')
# saveRDS(bowl_avg_sample, file = "bowl_avg.rds")
# readRDS(file = "bowl_avg.rds")

# Mean Wkts per Game = 2.
combined_wkts_per_game <- unlist(na.omit(combined_df[, "Wkts per game"]))
# wkts_per_game_sample <- sample(combined_wkts_per_game, 200, replace=TRUE) %>% data.frame(`WktsPerGame`=.)
ggplot(wkts_per_game_sample, aes(x=`WktsPerGame`)) + geom_histogram(color='black', fill='white')
# saveRDS(wkts_per_game_sample, file = "wkts.rds")
# readRDS(file = "bowl_avg.rds")

# Computing Sample Means
n <- 200
mean_bat_avg_hat <- sum(bat_avg_sample[, "BatAvg"]) / n
mean_bowl_avg_hat <- sum(bowl_avg_sample[, "BowlAvg"]) / n
mean_wkts_per_game_hat <- sum(wkts_per_game_sample[, "WktsPerGame"]) / n

# Computing 95% Confidence Intervals
# Z Value
z_value <- qnorm((1-0.95)/2)

# Standard Deviations
mean_bat_avg_sd <- sd(bat_avg_sample[, "BatAvg"])
mean_bowl_avg_sd <- sd(bowl_avg_sample[, "BowlAvg"])
mean_wkts_per_game_sd <- sd(wkts_per_game_sample[, "WktsPerGame"])

# Confidence Intervals
mean_bat_avg_cf_95 <- mean_bat_avg_hat + c(1, -1) * (z_value * mean_bat_avg_sd / sqrt(n))
mean_bowl_avg_cf_95 <- mean_bowl_avg_hat + c(1, -1) * (z_value * mean_bowl_avg_sd / sqrt(n))
mean_wkts_per_game_cf_95 <- mean_wkts_per_game_hat + c(1, -1) * (z_value * mean_wkts_per_game_sd / sqrt(n))
print("Mean Bat Avg 95 CF: ")
print(mean_bat_avg_cf_95)
print("Mean Bowl Avg 95 CF: ")
print(mean_bowl_avg_cf_95)
print("Mean Wickets per Game 95 CF: ")
print(mean_wkts_per_game_cf_95)

