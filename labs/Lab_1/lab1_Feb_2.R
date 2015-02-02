# 1. Plot y vs x
x<-seq(-10,20,by=0.01)
y<-0.1*x^3-2*x^2+0.1*x
# 2. Compare the difference in mfrow and mfcol in par() function
par(mfrow=c(2,2))
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 1')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 2')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 3')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 4')

par(mfcol=c(2,2))
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 1')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 2')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 3')
plot(x,y,type='p',xlab='x_axis',ylab='y_axis',xlim=c(-10,20),main='x-y Plot 4')

# 3. readt table
setwd("~/Github_Repo/Statistical_Data_Mining/labs/Lab_1/")
Corolla_data<-read.table('ToyotaCorolla.csv',sep=',',header=T)
# Corolla_data<-read.csv('ToyotaCorolla.csv')
Corolla_data<-Corolla_data[1:1436,]
sum(is.na(Corolla_data))
names(Corolla_data)
corollas2<-Corolla_data[,c(3,4,7,8,9,10,14,17,18)]
is.factor(corollas2[,"Fuel_Type"])
str(corollas2[,"Fuel_Type"])

levels(corollas2[,"Fuel_Type"])
corollasLM=lm(formula=Price ~., data=corollas2)
summary(corollasLM)
names(corollas2)
pairs(corollas2[,c(1:3,5,7:9)])
