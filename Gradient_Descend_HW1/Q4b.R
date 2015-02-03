# Question 4a
setwd("~/Github_Repo/Statistical_Data_Mining/Gradient_Descend_HW1/")
w<-seq(0.5,2,by=0.01)
Num_w<-length(w)
x_vec<-c(1,2,3,4,5) # x values of the points
y_act<-c(1,2,4,3,30) # y values of the points
step<-0.01

BiasRatio<-c(0.01,0.2,0.4,1,2,10)
colorsChoices<-c("blue","green","orange","grey","red","chocolate","yellow")
PlotFitfunction<-function(EsitmationBiasRatio,LineColor){
     error<-numeric(Num_w)
     for (i in 1:Num_w) {
          temp<-(pmax(y_act-x_vec*w[i],0))+EsitmationBiasRatio*(pmax(x_vec*w[i]-y_act,0))
          error[i]<-sum(temp)
     }
     #plot(w,error)
     whole_set<-1:5
     grad_q4<-function(w_temp) {
          point_error_vect<-rep(0,5)
          over_set<-which(w_temp*x_vec-y_act>0) # get a index vector of overestimated points
          under_set<-setdiff(whole_set,over_set)# get a index vector of underestimated points
          point_error_vect[under_set]<--x_vec[under_set]
          point_error_vect[over_set]<-x_vec[over_set]*EsitmationBiasRatio    
          sum(point_error_vect) #sum up the absolute residual of each point
     }
     w_temp<-runif(1,-3,3)
     gradient_w4<-grad_q4(w_temp)
     for (i in 1:200) {
          #while (abs(step*gradient_w4)>0.1) {
          w_temp<-w_temp-step*gradient_w4
          gradient_w4<-grad_q4(w_temp)
          #print (w_temp)
     }
#     y_fit<-w_temp*x_vec
     x_vec2<-c(0,x_vec,6)
     y_fit<-w_temp*x_vec2
     if (EsitmationBiasRatio==BiasRatio[1]) {
#          png('Q4_4.png')
          plot(x_vec,y_act,type='p',xlab="x",ylab="y",main="multiple fitted models",xlim=c(0,5),ylim=c(0,30),lwd=3)
          lines(x_vec2,y_fit,type='l',lwd=2.5,col=LineColor)
     }
     else if (EsitmationBiasRatio==2) {
          lines(x_vec2,y_fit,type='l',lwd=3.5,col=LineColor)}
     else{
          lines(x_vec2,y_fit,type='l',lwd=2.5,col=LineColor)
     }          
}

for (i in seq_along(BiasRatio)){
     PlotFitfunction(BiasRatio[i],colorsChoices[i])
}
legend(0,30,BiasRatio,lty=c(1,1),lwd=2.5,col=colorsChoices)