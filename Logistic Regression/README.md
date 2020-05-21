# README: Logistic Regression

## LogisticRegression.m - Implementation of (Unregularized) Logistic Regression Classifier
  main.m - Learns a logistic classifier on different sized training samples (learning curve)
  
## LogisticRegressionL2.m - Implementation of L2 Regularized Logistic Regression Classifier
  main2.m - Learns an L2 regularized classifier; uses five-fold cross validation on different values of λ to find optimal
  
  RegCalculator.m - Helper for L2

###### Helper Functions
yHatCalculator.m - Helper to find yhat values (guesses of classifier)

classification_error.m - Finds 0-1 error between predicted and actual y values
