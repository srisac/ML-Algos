# README: Support Vector Machines (SVMs) - Linear, Polynomial Kernel, RBF Kernel

## SVM.m - Implementation of SVM
## NonLinearSVM - For nonlinear SVMs

## Main1.m - Uses five-fold cross validation on different values C, q, γ for linear, polynomial, and RBF SVMs respectively find optimal
#foldCalc.m - Helper for linear cross validation
#foldNonLin.m - Helper for nonlinear cross validation

##decision_boundary.m - Script to visualize the decision boundary created by the SVMs

###### General Helper Functions
kernel_calculator.m - Helper to calculate kernels in nonlinear cases

ycalcNonLinear.m - Helper to find yhat values for nonlinear cases (guesses of classifier)

y_calculator.m - Helper to find yhat values for linear cases (guesses of classifier)

classification_error.m - Finds fractional error
