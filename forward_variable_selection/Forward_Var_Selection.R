# Forward 
# By Chris Zeng, March 21, 2015
# Note that this assume that the Response values are stored in the first column, and
# all other predictors in the following columns

setwd("~/Github_Repo/Statistical_Data_Mining/forward_variable_selection") # Change

rm(list=ls())
USCrime<-read.table('US_crime.txt',header=T)
ColnNames<-colnames(USCrime)
DataLength<-dim(USCrime)[1]
DataWidth<-dim(USCrime)[2]

# Store the column numbers of the predictors into a set.

# create a temporay table that stores new overwriteable columns 
# Assume the response/target values are stored in column 1
TargetColNum<-1
TempTabl<-as.data.frame(USCrime[,TargetColNum])
names(TempTabl)[1]<-ColnNames[TargetColNum]
lm_response<-as.formula(paste(ColnNames[TargetColNum],"~.",sep=""))

PredictorSet<-1:DataWidth
PredictorSet<-PredictorSet[-TargetColNum]

FinalPredictorSet<-c(); #included predictor index
IncludedPredictors<-c(); #included predictor names
insertColn=2; # initial insert coln in the second


while (length(PredictorSet)>0) {
     print ("Left over predictor")
     print (length(PredictorSet))
     print (rbind(PredictorSet,ColnNames[PredictorSet]))
     RsquaredVec<-c(); # reset vector that stores adjusted R square
     NewPred_Pval<-c(); # reset vector that stores p values

     for (i in PredictorSet) {
          TempTabl[,insertColn]<-as.data.frame(USCrime[,i]) # overwrite the inserted column with each predictor column
          names(TempTabl)[insertColn]<-ColnNames[i] # overwrite the table name
          
          templinear<-lm(lm_response,data=TempTabl) # linear regression mode
          temprsq<-summary(templinear)$adj.r.squared
          RsquaredVec<-c(RsquaredVec,temprsq)
          tempPval<-summary(templinear)$coeff[insertColn,4] #store R
          NewPred_Pval<-c(NewPred_Pval,tempPval)
     }
     
     # Store a temporary version of the predictor set
     TempSet<-PredictorSet
     # find the predictor with the maximum R^2
     while (length(TempSet)>0) {
          print ("Left over temp predictor")
          print (length(TempSet))
          print (rbind(TempSet,ColnNames[TempSet],NewPred_Pval,RsquaredVec))
          # Find the 
          IndexInPredSet<-which.max(RsquaredVec)
          if (NewPred_Pval[IndexInPredSet]<=0.05) {
               print (ColnNames[TempSet[IndexInPredSet]])
               IncludedPredictors<-c(IncludedPredictors,ColnNames[TempSet[IndexInPredSet]]) # which predictor
               FinalPredictorSet<-c(FinalPredictorSet,TempSet[IndexInPredSet])
               # finalize inserting one chosen column
               TempTabl[,insertColn]<-as.data.frame(USCrime[,TempSet[IndexInPredSet]]) #Finalize which column to include
               names(TempTabl)[insertColn]<-ColnNames[TempSet[IndexInPredSet]] #finalize the name of the predictor
               insertColn=insertColn+1;
               PredictorSet<-PredictorSet[-IndexInPredSet] # reduce the PredictorSet 
               break
          }else {
               # if the predictor with largest R
               RsquaredVec<-RsquaredVec[-IndexInPredSet]
               NewPred_Pval<-NewPred_Pval[-IndexInPredSet]
               TempSet<-TempSet[-IndexInPredSet]
          }
     }
     # if cannot find any predictor in this iteration, terminate
     if(length(TempSet)==0) {
          PredictorSet<-NULL
          length(PredictorSet)
     }
}

TempTabl<-NULL;
print (rbind(FinalPredictorSet,IncludedPredictors))

FinalTable<-USCrime[,c(TargetColNum,FinalPredictorSet)]
Final_lm<-lm(lm_response,FinalTable)
print(summary(Final_lm))
