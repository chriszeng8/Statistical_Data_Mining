# Question 3 absolute error
w<-seq(0.8,1.5,by=0.1)
x_vec<-c(1,2,3,4,5) # x values of the points
y_act<-c(1,2,4,3,30) # y values of the points

sum_abs<-function(x,y,m) { # a function that compute the sum of absolute difference
     diff_y<-(y-x*m);sum(abs(diff_y))}

error_vec2<-numeric(length(w)) # compute sum of absolute deviation for all w
for (i in seq_along(w)) {error_vec2[i]<-sum_abs(x_vec,y_act,w[i])}

png("./Q3_1.png", 490, 350) 
plot(w,error_vec2,xlab='w',ylab='E(w)',main='Error E(w) against w',type='l')
opt_m=sum(x_vec*y_act)/sum(x_vec^2)
dev.off()

w_intial<-runif(1,min=-10,max=10)
w_temp<-w_intial

grad<-function(x,y,w){ # a function to compute gradient
     is_y_greater<-y>w*x
     # find x[i] that y[i]-w*x[i]>0, i.e., y[i]>w*x[i]
     sum_x_when_y_greater<-if (length(x[is_y_greater])>0) {
          -sum(x_vec[is_y_greater])} else {0}
     # find x[i] that y[i]-w*x[i]<=0, i.e., y[i]<=w*x[i]
     sum_x_when_y_less<-if (length(x_vec[!is_y_greater])>0) {
          sum(x_vec[!is_y_greater])} else {0}
     grad<-sum_x_when_y_greater+sum_x_when_y_less
     grad
}

gradient_w3<-grad(x_vec,y_act,w_temp)

for (i in 1:500) { # w_temp after 500 iteration, will be our final w.
     w_temp<-w_temp-step*gradient_w3
     gradient_w3<-grad(x_vec,y_act,w_temp)
     error_3<-sum_abs(x_vec,y_act,w_temp)
     print(w_temp)
}

png("./Q3_2.png", 490, 350) 
plot(x_vec,y_act,type='p',xlab='x',ylab='y',xlim=c(0,6),ylim=c(0,30))
lines(c(0,x_vec,6),c(0,x_vec,6)*w_temp,type='l',lwd=2.5,col='red')
lines(c(0,x_vec,6),c(0,x_vec,6)*3.25,type='l',lwd=2.5,col='blue')
legend(0,30,c('squared diff - Problem 1','absolute diff - Problem 3'),lty=c(1,1),lwd=2.5,col=c('blue','red'))
dev.off()