library(dplyr)
library(rvest)
library(ggplot2)

URL <- "http://www.howstat.com/cricket/statistics/players/PlayerCountryList.asp?Country="
countries <- c("AUS", 'IND', 'SAF', 'ENG', 'WIN', 'PAK', 'NZL', 'SRL')
urls <- c()

for (country in countries) {
  urls <- c(urls, paste(URL,country,sep=""))
}
print(urls)
print(length(urls))

aus_url <- paste(URL, countries[1], sep="")
ind_url <- paste(URL, countries[2], sep="")
sfa_url <- paste(URL, countries[3], sep="")
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
summary(aus_test_df)

ggplot(na.omit(aus_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# india data
nodes <- read_html(ind_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

ind_test_df <- df[,1:6]
ind_test_df <- ind_test_df[-c(1,2),]
colnames(ind_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(ind_test_df) <- 1:nrow(ind_test_df)
ind_test_df[,2:6] <- sapply(ind_test_df[, 2:6], as.numeric)
summary(ind_test_df)

ggplot(na.omit(ind_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# south africa data
nodes <- read_html(sfa_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

sfa_test_df <- df[,1:6]
sfa_test_df <- sfa_test_df[-c(1,2),]
colnames(sfa_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(sfa_test_df) <- 1:nrow(sfa_test_df)
sfa_test_df[,2:6] <- sapply(sfa_test_df[, 2:6], as.numeric)
summary(sfa_test_df)

ggplot(na.omit(sfa_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# england data
nodes <- read_html(eng_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

eng_test_df <- df[,1:6]
eng_test_df <- eng_test_df[-c(1,2),]
colnames(eng_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(eng_test_df) <- 1:nrow(eng_test_df)
eng_test_df[,2:6] <- sapply(eng_test_df[, 2:6], as.numeric)
summary(eng_test_df)

ggplot(na.omit(eng_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# west indies data
nodes <- read_html(win_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

win_test_df <- df[,1:6]
win_test_df <- win_test_df[-c(1,2),]
colnames(win_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(win_test_df) <- 1:nrow(win_test_df)
win_test_df[,2:6] <- sapply(win_test_df[, 2:6], as.numeric)
summary(win_test_df)

ggplot(na.omit(win_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# pakistan data
nodes <- read_html(pak_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

pak_test_df <- df[,1:6]
pak_test_df <- pak_test_df[-c(1,2),]
colnames(pak_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(pak_test_df) <- 1:nrow(pak_test_df)
pak_test_df[,2:6] <- sapply(pak_test_df[, 2:6], as.numeric)
summary(pak_test_df)

ggplot(na.omit(pak_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# New Zealand data
nodes <- read_html(nzl_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

nzl_test_df <- df[,1:6]
nzl_test_df <- nzl_test_df[-c(1,2),]
colnames(nzl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(nzl_test_df) <- 1:nrow(nzl_test_df)
nzl_test_df[,2:6] <- sapply(nzl_test_df[, 2:6], as.numeric)
summary(nzl_test_df)

ggplot(na.omit(nzl_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

# Sri Lanka data
nodes <- read_html(srl_url) %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]
df[df=="" | df=="0" | df=="0.00"]<-NA

srl_test_df <- df[,1:6]
srl_test_df <- pak_test_df[-c(1,2),]
colnames(srl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(srl_test_df) <- 1:nrow(srl_test_df)
srl_test_df[,2:6] <- sapply(srl_test_df[, 2:6], as.numeric)
summary(srl_test_df)

ggplot(na.omit(srl_test_df), aes(x=Matches, y=`Bat Avg`)) + geom_point()

