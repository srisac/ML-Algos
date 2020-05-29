function [type, SV_1, SV_all, alpha_vals, bias] = NonLinearSVM(traindata, trainlabels, cost, kernel, r)
    type = kernel;
    [m, d] = size(traindata);
    hMatrix = zeros(m, m);
    
    for i = 1:m
        for j = 1:m
            hMatrix(i, j) = kernel_calculator(transpose(traindata(i, :)), transpose(traindata(j, :)), kernel, r)*trainlabels(i, 1)*trainlabels(j, 1);
        end
    end
    
    b = zeros(m, 1) + cost;
    
    fVal = zeros(m, 1) - 1;
    options = optimoptions(@quadprog, 'MaxIterations', 5000);
    alpha_vals = quadprog(hMatrix, fVal, eye(m), b, transpose(trainlabels), 0, zeros(m, 1), zeros(m, 1) + cost, [], options);
    
    SV_1 = [];
    sizeSV_1 = 0;
    SV_all = [];
    sizeSV_all = 0;
    
    for i = 1:m
        if ((alpha_vals(i, 1) > 0.000001) && (alpha_vals(i, 1) < cost*0.999999))
            SV_1(1, sizeSV_1 + 1) = i;
            SV_all(1, sizeSV_all + 1) = i;
            sizeSV_1 = sizeSV_1 + 1;
            sizeSV_all = sizeSV_all + 1;
        elseif ((alpha_vals(i, 1) == cost))
            SV_all(1, sizeSV_all + 1) = i;
            sizeSV_all = sizeSV_all + 1;
        end
    end
    disp(SV_1)
    if (sizeSV_1 ~= 0)
        currSum = 0;
        for i = 1:sizeSV_1
            currV1ind = SV_1(1, i);
            currSum = currSum + trainlabels(currV1ind, 1);
            currXI = transpose(traindata(currV1ind, :));
            for j = 1:sizeSV_all
                currAlpInd = SV_all(1, j);
                currAlp = alpha_vals(currAlpInd, 1);
                currYJ = trainlabels(currAlpInd, 1);
                currXJ = transpose(traindata(currAlpInd, :));
                currSum = currSum - (currAlp*currYJ*kernel_calculator(currXI, currXJ, kernel, r));
            end
        end
        bias = currSum/sizeSV_1;
    else
        bias = 0;
    end
end