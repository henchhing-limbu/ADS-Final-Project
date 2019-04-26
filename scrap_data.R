library(dplyr)
library(rvest)

URL <- "http://www.howstat.com/cricket/statistics/players/PlayerCountryList.asp?Country="
countries <- c("AUS", 'IND', 'SFA', 'ENG', 'WIN', 'PAK', 'NZL', 'SRL')
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
html_doc <- read_html(aus_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

aus_test_df <- df[,1:6]
aus_test_df <- aus_test_df[-c(1,2),]
colnames(aus_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(aus_test_df) <- 1:nrow(aus_test_df)

# india data
html_doc <- read_html(ind_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

ind_test_df <- df[,1:6]
ind_test_df <- ind_test_df[-c(1,2),]
colnames(ind_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(ind_test_df) <- 1:nrow(ind_test_df)

# south africa data
# html_doc <- read_html("http://www.howstat.com/cricket/statistics/players/PlayerCountryList.asp?Country=SFA")
# nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
# df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

# sfa_test_df <- df[,1:6]
# sfa_test_df <- sfa_test_df[-c(1,2),]
# colnames(sfa_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
# row.names(sfa_test_df) <- 1:nrow(sfa_test_df)

# england data
html_doc <- read_html(eng_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

eng_test_df <- df[,1:6]
eng_test_df <- eng_test_df[-c(1,2),]
colnames(eng_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(eng_test_df) <- 1:nrow(eng_test_df)

# west indies data
html_doc <- read_html(win_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

win_test_df <- df[,1:6]
win_test_df <- win_test_df[-c(1,2),]
colnames(win_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(win_test_df) <- 1:nrow(win_test_df)

# pakistan data
html_doc <- read_html(pak_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

pak_test_df <- df[,1:6]
pak_test_df <- pak_test_df[-c(1,2),]
colnames(pak_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(pak_test_df) <- 1:nrow(pak_test_df)

# New Zealand data
html_doc <- read_html(nzl_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

nzl_test_df <- df[,1:6]
nzl_test_df <- nzl_test_df[-c(1,2),]
colnames(nzl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(nzl_test_df) <- 1:nrow(nzl_test_df)

# Sri Lanka data
html_doc <- read_html(srl_url)
nodes <- html_doc %>% html_nodes(xpath='//*[@class="TableLined"]')
df <- html_table(nodes,header=NA,fill=TRUE) [[1]]

srl_test_df <- df[,1:6]
srl_test_df <- pak_test_df[-c(1,2),]
colnames(srl_test_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
row.names(srl_test_df) <- 1:nrow(srl_test_df)



# TODO: do something about missing values
# odi_df <- df[,c('X1', 'X7', 'X8', 'X9', 'X10', 'X11')]
# odi_df <- odi_df[-c(1,2),]
# colnames(odi_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
# row.names(odi_df) <- 1:nrow(odi_df)

# t20_df <- df[,c('X1', 'X12', 'X13', 'X14', 'X15', 'X16')]
# t20_df <- t20_df[-c(1,2),]
# colnames(t20_df) <- c("Names", "Matches", "Runs", "Bat Avg", "Wkts", "Bowl Avg")
# row.names(t20_df) <- 1:nrow(t20_df)



