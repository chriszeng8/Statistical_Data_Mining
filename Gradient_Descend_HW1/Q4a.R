# Question 4a
w<-seq(0.5,2,by=0.01)
Num_w<-length(w)
x_vec<-c(1,2,3,4,5) # x values of the points
y_act<-c(1,2,4,3,30) # y values of the points
step<-0.01

EsitmationBiasRatio<-2
error<-numeric(Num_w)
for (i in 1:Num_w) {
     temp<-(pmax(y_act-x_vec*w[i],0))+EsitmationBiasRatio*(pmax(x_vec*w[i]-y_act,0))
     error[i]<-sum(temp)
}
png('./Q4_2.png')
plot(w,error,type='l')
dev.off()

whole_set<-1:5
grad_q4<-function(w_temp) {
     point_error_vect<-rep(0,5)
     over_set<-which(w_temp*x_vec-y_act>0) # get a index vector of overestimated points
     under_set<-setdiff(whole_set,over_set)# get a index vector of underestimated points
     point_error_vect[under_set]<--x_vec[under_set]
     point_error_vect[over_set]<-x_vec[over_set]*EsitmationBiasRatio    
     sum(point_error_vect) #sum up the absolute residual of each point
}

w_temp<-0.7
gradient_w4<-grad_q4(w_temp)
for (i in 1:100) {
#while (abs(step*gradient_w4)>0.1) {
     w_temp<-w_temp-step*gradient_w4
     gradient_w4<-grad_q4(w_temp)
     print (w_temp)
}
y_fit<-w_temp*c(0,x_vec,6)
png('./Q4_4a.png')
plot(c(0,x_vec,6),y_fit,xlab='x',ylab='y',type='l',lwd=2.5,col='red',xlim=c(0,6),ylim=c(0,30))
lines(x_vec,y_act,type='p',lwd=2.5)
legend(0,30,'Over/Under Ratio = 2',lty=c(1,1),lwd=2.5,col='red')
dev.off()