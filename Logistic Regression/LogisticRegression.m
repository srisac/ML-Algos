function [w, b] = LogisticRegression(traindata, trainlabels)
    % INPUT : 
    % traindata   - m X n matrix, where m is the number of training points
    % trainlabels - m X 1 vector of training labels for the training data    
    
    % OUTPUT
    % returns learnt model: w - n x 1 weight vector, b - bias term
    
    % Fill in your code here    
    % Consider using fminunc MATLAB function for solving the logistic regression optimization problem.
    [m, n] = size(traindata);
    function likelihood = FindLikelihood(params)
        likelihood = 0;
        for loop_index = 1:m
            currVec = traindata(loop_index, :);
            exponent = (transpose(params(1:n, 1)))*(transpose(currVec));
            yVal = trainlabels(loop_index, 1);
            likelihood = likelihood + log2(1 + exp(-1*yVal*(exponent + params(n+1))));
        end
        likelihood = likelihood/m;
    end

    options = optimoptions('fminunc', 'MaxFunEvals', 2e6, 'MaxIter', 2e6);
    initParams = zeros((n+1), 1);
    out = fminunc(@FindLikelihood, initParams, options);
    w = out(1:n, 1);
    b = out(n+1, 1);
end