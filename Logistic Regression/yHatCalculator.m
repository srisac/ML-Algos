function yhat = yHatCalculator(w, b, x)
    [m, n] = size (x);
    yhat = zeros(m, 1);
    for loop_index = 1:m
        currSum = transpose(w)*transpose(x(loop_index, :)) + b;
        yhat(loop_index, 1) = sign(currSum);
        if (yhat(loop_index, 1) == 0)
            yhat(loop_index,1) = -1;
        end
    end
end