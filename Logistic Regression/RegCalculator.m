function yhat = RegCalculator(w, b, x)
    [m, n] = size (x);
    yhat = zeros(m, 1);
    for loop_index = 1:m
        currSum = transpose(w)*transpose(x(loop_index, :)) + b;
        yhat(loop_index, 1) = currSum;
    end
end