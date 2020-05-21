function [w, b] = LeastSquaresRegression(traindata, trainlabels, lambda)
    % INPUT : 
    % traindata   - m X n matrix, where m is the number of training points
    % trainlabels - m X 1 vector of training labels for the training data
    % lambda - a double
    
    % OUTPUT
    % returns learnt model: w - n x 1 weight vector, b - bias term
    
    % Fill in your code here    
    % Consider using fminunc MATLAB function for solving the logistic regression optimization problem.
    [m, n] = size(traindata);
    toCat = ones(m, 1);
    newdata = horzcat(traindata, toCat);
    rmat = eye(n+1);
    rmat(n+1, n+1) = 0;
    out = ((transpose(newdata)*newdata) + (lambda*m*rmat))\transpose(newdata)*trainlabels;
    w = out(1:n, 1);
    b = out(n+1, 1);
end