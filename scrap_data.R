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
summary(aus_test_df)
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

