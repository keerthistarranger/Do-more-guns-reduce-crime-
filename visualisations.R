library(tidyverse)
library(data.table)
library(haven)
library(vars)
library(het.test)
library(plm)
library(lme4)
library(plotrix)


mx_dta = read_dta("guns (1).dta")
write.csv(mx_dta, file = "mx.csv")
mx=read.csv("mx.csv")
mx$X=NULL

#part a
names(mx)
summary(mx)
hist(mx$year)
view(mx)
pie(mx$shall)

pie1<-as.numeric(mx$shall)
pie2<-table(mx$shall)
lbl<-c("no","yes")
pie(pie2, main = "Pie chart which represents whether a shall law was passed or not", col = rainbow(2))
pie3D(pie2,labels=lbl,radius=2,height=0.05,explode = 0.0, main = "Pie chart which represents whether a shall law was passed or not")

cormat <- round(cor(mx),2)
head(cormat)

library(reshape2)
melted_cormat <- melt(cormat)
head(melted_cormat)

library(ggplot2)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()


vio1<- log(mx$vio)
mur1<- log(mx$mur)
rob<- log(mx$rob)
inc<- log(mx$incarc_rate)
pop<- log(mx$pop)
avg<- log(mx$avginc)
den<- log(mx$density)

hist(vio1)
plot(vio1)
hist(avg)
hist(den)
hist(inc)
hist(mur1)
hist(mx$pb1064)
hist(mx$pw1064)
hist(mx$pm1029)
hist(rob)

hist(rob,main="Histogram for Robbery", xlab = "robbery", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(vio1,main="Histogram for Violence rate", xlab = "violence", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(avg,main="Histogram for average income", xlab = "avg income", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(den,main="Histogram for density", xlab = "density", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(inc,main="Histogram for incarceration rate", xlab = "incarceration rate", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$pb1064,main="Histogram for pb1064", xlab = "pb1064", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$pw1064,main="Histogram for pw1064", xlab = "pw1064", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$pm1029,main="Histogram for pm1029", xlab = "pm1029", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$mur,main="Histogram for murder", xlab = "murder", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$shall,main="Histogram for shall rate", xlab = "shall rate", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)
hist(mx$pop,main="Histogram for population", xlab = "population", ylab = "Count",border="red", col="blue",las=1,labels=TRUE)

