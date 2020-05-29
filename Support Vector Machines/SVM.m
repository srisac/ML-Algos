function [type, w, SV_1, SV_2, SV_3, alphasSV_1, alphasSV_2, alphasSV_3,  bias] = SVM(traindata, trainlabels, cost, kernel, r)
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
    w = zeros(d, 1);
    SV_1 = [];
    sizeSV_1 = 0;
    SV_2 = [];
    sizeSV_2 = 0;
    SV_3 = [];
    sizeSV_3 = 0;
    alphasSV_1 = [];
    sizealp1 = 0;
    alphasSV_2 = [];
    sizealp2 = 0;
    alphasSV_3 = [];
    sizealp3 = 0;
    
    for i = 1:m
        w = w + alpha_vals(i, 1) * trainlabels(i, 1) * transpose(traindata(i, :));
        if ((alpha_vals(i, 1) > 0) && (alpha_vals(i, 1) < cost))
            SV_1(1, sizeSV_1 + 1) = i;
            alphasSV_1(1, sizealp1 + 1) = alpha_vals(i, 1);
            sizeSV_1 = sizeSV_1 + 1;
            sizealp1 = sizealp1 + 1;
        end
    end
    
    currSum = 0;
    if (sizeSV_1 ~= 0)
        for i = 1:sizeSV_1
            currIndex = SV_1(1, i);
            currSum = currSum + trainlabels(currIndex, 1) - transpose(w)*transpose(traindata(currIndex, :));
        end
        bias = currSum/sizeSV_1;  
    else 
        bias = 0;
    end
    
    for i = 1:m
        if ((alpha_vals(i, 1) == cost) && ((transpose(w)*transpose(traindata(i, :)) + bias)*trainlabels(i, 1) > 0))
            SV_2(1, sizeSV_2 + 1) = i;
            alphasSV_2(1, sizealp2 + 1) = alpha_vals(i, 1);
            sizeSV_2 = sizeSV_2 + 1;
            sizealp2 = sizealp2 + 1;
        end

        if ((alpha_vals(i, 1) == cost) && ((transpose(w)*transpose(traindata(i, :)) + bias)*trainlabels(i, 1) <= 0))
            SV_3(1, sizeSV_3 + 1) = i;
            alphasSV_3(1, sizealp3 + 1) = alpha_vals(i, 1);
            sizeSV_3 = sizeSV_3 + 1;
            sizealp3 = sizealp3 + 1;
        end
    end
end