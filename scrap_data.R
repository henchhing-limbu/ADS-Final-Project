library(dplyr)
library(rvest)

url <- "http://www.howstat.com/cricket/statistics/players/PlayerCountryList.asp?Country=AUS"
html_doc <- read_html(url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

test_df <- df[,1:6]
test_df <- test_df[-c(1,2),]
colnames(test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(test_df) <- 1:nrow(test_df)

# TODO: do something about missing values

odi_df <- df[,c('X1', 'X7', 'X8', 'X9', 'X10', 'X11')]
odi_df <- odi_df[-c(1,2),]
colnames(odi_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(odi_df) <- 1:nrow(odi_df)

t20_df <- df[,c('X1', 'X12', 'X13', 'X14', 'X15', 'X16')]
t20_df <- t20_df[-c(1,2),]
colnames(t20_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(t20_df) <- 1:nrow(t20_df)




