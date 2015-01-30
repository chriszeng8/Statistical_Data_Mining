# Jan 28, 2015
# Author: Chris Zhuo Zeng
# Question 1

# Create a set of equally spaced values between -5 and 5 with increment of 0.1
w<-seq(-10,10,by=0.1)
x_vec<-c(1,2,3,4,5) # x values of the points
y_act<-c(1,2,4,3,30) # y values of the points

# Define a function that
sum_sqr<-function(x,y,m) {
     diff_y<-(y-x*m)
     sum(diff_y^2)
}

# Create a numeric(zeros) vector of the same length as w vector
error_vec<-numeric(length(w))

# Calculate errors for all w values
for (i in seq_along(w)) {
     error_vec[i]<-sum_sqr(x_vec,y_act,w[i])
}

# Plot the error vs w
plot(w,error_vec,type='l',xlab='w',ylab='E(w)',main='Error E(w) against w')

# Calculate the optimum m that minimizes the vector
opt_m=sum(x_vec*y_act)/sum(x_vec^2)