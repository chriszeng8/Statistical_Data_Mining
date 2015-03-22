##Motivation
March 21, 2015
One of the frequently encountered problem in regression is: how do we decide what predictors to include in a linear regression model? Do we simply run a regression with all predictors and then just remove the predictors with the p-value greater 0.05? (Well, the answer is no for most cases, esp when multicolinearity exists.)

####Forward Variable Selection
One of the method to answer this question is Forward Variable Selection Method:

The forward variable selection is an algorithm that greedily adds variables to the model one at a time according to some criterion. 

#####Steps:
1. Start with a model with no predictors.
2. Add a predictor to the current model with largest adjusted-R2(for the definition of adjuested-R2, see wikipedia page), i.e., add each predictor which are currently not included in the model individually and with each predictor you get a new model, pick the new model with the highest adjuested-R2 (provided the p-value pf the newly added predictor in the new model is less than some cut-off level, here we use 0.05).
3. Let the new model be the current model. Repeat step (2) until no new predictor is significant at cut-off level. 