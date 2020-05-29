function out = ycalcNonLinear(newdata, traindata, trainlabels, b, SV_all, alpha_vals, kernel, r)
    [m, ~] = size(newdata);
    [~, n] = size(SV_all);
    out = zeros(m, 1);
    currSum = 0;
    for j = 1:m
        newX = transpose(newdata(j, :));
        for i = 1:n
            currInd = SV_all(1, i);
            currAlp = alpha_vals(currInd, 1);
            currY = trainlabels(currInd, 1);
            currX = transpose(traindata(currInd, :));
            currSum = currSum + currAlp*currY*kernel_calculator(currX, newX, kernel, r);
        end
        out(j, 1) = sign(currSum + b);
        if out(j, 1) == 0
            out(j, 1) = -1;
        end
    end
end