# First hour
# Installation
# User interface
# Hello world
# variables
# matrix vs data frames
# filtering
# manipulation
# functions
# loops 
# aggregates 
# 
# Second hour
# libraries
# graphing 
# time series 
# further reading

# First hour
# Installation
#https://cran.r-project.org/
#https://www.rstudio.com/products/rstudio/download/
# User interface
# run a line or whole program
# Hello world
print("hello world")
# variables
firstword = "hello"
secondword <- "world"
finalword = paste(firstword,secondword,sep = "_")
my.df <- data.frame(x=1:2, y=3:4)

data()
library(datasets)
data(cars)
View(cars)
write.csv(cars, "cars.csv")
somenewdata = read.csv( "cars.csv")
# matrix vs data frames
str(somenewdata)
dim(somenewdata)
colnames(somenewdata)
matrixdata = as.matrix(somenewdata)
str(matrixdata)
somenewdata$name = "vw"
matrixdataagain = as.matrix(somenewdata)
str(matrixdataagain)
# filtering
somenewdata
somenewdata[12,]
somenewdata[12,3]
somenewdata[12,c(2,3)]
somenewdata[12,c(2,4)]
somenewdata[somenewdata$speed==12,] 
somenewdata[somenewdata$speed==12 & somenewdata$dist==20  ,4] 

# manipulation
colnames(somenewdata)
somenewdata = somenewdata[,-1]
somenewdata[somenewdata$speed==12,3] 
somenewdata[somenewdata$speed==12,3] = "bmw"
somenewdata
somenewdata[somenewdata$speed==12 & somenewdata$dist==20  ,3] = "audi"
somenewdata

# functions
getDistance = function(brand){
  originalTable = somenewdata
  theRow = somenewdata[somenewdata$name == brand,]
  return (theRow$dist)
}

getDistance("bmw")
getDistance("audi")
getDistance("vw")

# loops 
for (i in 1:10 ){
  print("hello")
}
for (i in 1:10 ){
  print(i)
}
for (i in 1:10 ){
  print(i*i)
}
for (i in c(1,10,12) ){
  print(i*i)
}


# aggregates 
min(somenewdata$speed)
max(somenewdata$speed)
mean(somenewdata$speed)
summary(somenewdata)
head(somenewdata)
tail(somenewdata)

library(dplyr)
bigsummary = somenewdata %>% group_by(name) %>% summarise(averagespeed = mean(speed), averagedist = mean(dist))
bigsummary = somenewdata %>% group_by(name,speed) %>% summarise( averagedist = mean(dist))

# 
# Second hour
# libraries
library(lubridate)
date = "2019-07-08 11:58:12"
ymd(date) #fail
ymd_hms(date)
ymd_hms(date,tz="Africa/Johannesburg")


dateNoTime = "2019-07-08"
ymd_hms(dateNoTime) #fail
ymd(dateNoTime) 
date(ymd_hms(date))


# graphing 
plot(somenewdata$speed, somenewdata$dist)
lines(predict(lm(somenewdata$speed~somenewdata$dist)),col='green')
lines(predict(lm(somenewdata$speed~somenewdata$dist))*somenewdata$speed/3,col='green')
library(esquisse)

# time series 
set.seed(123)
t <- seq(from = 1, to = 100, by = 1) + 10 + rnorm(100, sd = 7)
plot(t)
timeseries <- ts(t, start = c(2000, 1), frequency = 4)
print(timeseries)
plot(timeseries)
timeseriesdecomposed <- decompose(timeseries, type="multi")
plot(timeseriesdecomposed)
trend = timeseriesdecomposed$trend
plot(trend)
library(forecast)
forecast = holt(trend, damped=TRUE, h = 100)
plot(forecast)
forecast = holt(trend, damped=FALSE, h = 100)
plot(forecast)

#further reading
#https://www.r-bloggers.com/a-crash-course-in-r/

