# conflictforecasting.R
# Vito D'Orazio
# generates country-month predictions of state-based violence
# see VIEWS documents for more information: https://viewsforecasting.org/

#################################
# PART ONE: Setup 

# clear everything in memory
rm(list=ls())

# set your working directory, it's where all your files are
setwd("/Users/vjdorazio/Desktop/github/forecasting-workshop")

install.packages("ggplot2")
install.packages("randomForest")
install.packages("tidyr")
install.packages("plm")
install.packages("arrow")

# load up these libraries
library(ggplot2)
library(randomForest)
library(tidyr)
library(plm)
library(arrow)

## some functions

# mean squared error scoring function
mse <- function(p, a) {
  return(mean((p-a)^2))
}

# s is a number 1-12, df must have 3 cols named: ged_sb, month_id, and isoname
# function creates a dataframe with 4 cols: pred_ged_sb, pred_month_id, month_id, isoname
# returns merge with original
builddv <- function(s, df) {
  out <- df
  df <- df[,c("ged_sb", "month_id", "isoname")]
  colnames(df)[1] <- "pred_ged_sb"
  df$pred_month_id <- df$month_id
  df$month_id <- df$month_id - s
  out <- merge(out, df, by=c("isoname", "month_id"), all.x=TRUE)
  out <- na.omit(out) 
  return(out)
}

################################################
# PART One: Data

# read in data
source("loadviews.R")

# here's your codebook: https://www.dropbox.com/scl/fo/rurpcmtpcquni5onoyuus/AI6p3CLXEGrRVak2wEsTgAM/codebooks?e=1&preview=cm_features_competition.pdf&rlkey=v1o4va647qrwc4la7m8i7cedk&st=3lzkrbnw&subfolder_nav_tracking=1&dl=0

# Merge on the country label data
mydata <- merge(cm, countries, 
                by.x = "country_id", by.y="id")

# Merge on the time periods info
mydata <- merge(mydata, month_ids[,2:4],
                by.x = "month_id", by.y="month_id")

# take a look at the column names
colnames(mydata)

# the variable we want to predict here is ged_sb

# how many months out? takes on value of 1-12
shift <- 1
mydata <- builddv(s=shift, df=mydata)

# use this to show the shift
temp <- mydata[which(mydata$isoname=="Egypt"),c('ged_sb', 'pred_ged_sb', 'month_id', 'pred_month_id')]

# data partitions
traindf <- mydata[which(mydata$Year < 2020),]
validdf <- mydata[which(mydata$Year >= 2020 & mydata$Year < 2023),]
testdf <- mydata[which(mydata$Year >= 2023),]

################################################
# PART TWO: Estimate Model

# for replication
set.seed(2025)

# train two models
rf1 <- randomForest(pred_ged_sb ~ ged_sb + ged_sb_tlag_1 + ged_sb_tlag_2, data = traindf)
rf2 <- randomForest(pred_ged_sb ~ ged_sb + ged_os + ged_ns, data = traindf)

# get the predictions on the validation data
validdf$pred1 <- predict(rf1, newdata=validdf)
validdf$pred2 <- predict(rf2, newdata=validdf)

# score it (lower is better)
mse(p=validdf$pred1, a=validdf$pred_ged_sb)
mse(p=validdf$pred2, a=validdf$pred_ged_sb)

# so i'll select rf2. testdf now used to estimate true out-sample performance
testdf$pred <- predict(rf2, newdata=testdf)
mse(p=testdf$pred, a=testdf$pred_ged_sb)

#######################################
# PART THREE: Visualizing Predictions

# rename column for viz
colnames(testdf)[which(colnames(testdf)=="pred")] <- "Predicted"
colnames(testdf)[which(colnames(testdf)=="pred_ged_sb")] <- "Actual"

# extract one country and score
syria <- testdf[which(testdf$isoname=="Syrian Arab Republic"),]
mse(p=syria$Predicted, a=syria$Actual) # mse for just syria

# reshape and plot
plotdata <- pivot_longer(data=syria, cols=c("Actual", "Predicted"), names_to="conflict")

# plot the predicted and actuals
ggplot(plotdata, aes(x=month_id, y=value, colour=conflict)) +
  geom_line() + ylab("State-Based Conflict Fatalities") +
  xlab("Month") + labs(title="Syria: Actual and Forecasted Conflict")
