function [w, b] = LeastSquaresRegression(traindata, trainlabels)
    % INPUT : 
    % traindata   - m X n matrix, where m is the number of training points
    % trainlabels - m X 1 vector of training labels for the training data    
    
    % OUTPUT
    % returns learnt model: w - n x 1 weight vector, b - bias term
    
    % Fill in your code here    
    % Consider using fminunc MATLAB function for solving the logistic regression optimization problem.
    [m, n] = size(traindata);
    toCat = ones(m, 1);
    newdata = horzcat(traindata, toCat);
    out = (inv(transpose(newdata)*newdata))*transpose(newdata)*trainlabels;
    w = out(1:n, 1);
    b = out(n+1, 1);
end