function err = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, cost, kernel, r)

    x1f = vertcat(x2, x3, x4, x5);
    x2f = vertcat(x1, x3, x4, x5);
    x3f = vertcat(x1, x2, x4, x5);
    x4f = vertcat(x1, x2, x3, x5);
    x5f = vertcat(x1, x2, x3, x4);

    y1f = vertcat(y2, y3, y4, y5);
    y2f = vertcat(y1, y3, y4, y5);
    y3f = vertcat(y1, y2, y4, y5);
    y4f = vertcat(y1, y2, y3, y5);
    y5f = vertcat(y1, y2, y3, y4);

    [~, ~, SV_all1, alpha_vals1, bias1] = NonLinearSVM(x1f, y1f, cost, kernel, r);
    [~, ~, SV_all2, alpha_vals2, bias2] = NonLinearSVM(x2f, y2f, cost, kernel, r);
    [~, ~, SV_all3, alpha_vals3, bias3] = NonLinearSVM(x3f, y3f, cost, kernel, r);
    [~, ~, SV_all4, alpha_vals4, bias4] = NonLinearSVM(x4f, y4f, cost, kernel, r);
    [~, ~, SV_all5, alpha_vals5, bias5] = NonLinearSVM(x5f, y5f, cost, kernel, r);

    yf1 = ycalcNonLinear(x1, x1f, y1f, bias1, SV_all1, alpha_vals1, kernel, r);
    yf2 = ycalcNonLinear(x2, x2f, y2f, bias2, SV_all2, alpha_vals2, kernel, r);
    yf3 = ycalcNonLinear(x3, x3f, y3f, bias3, SV_all3, alpha_vals3, kernel, r);
    yf4 = ycalcNonLinear(x4, x4f, y4f, bias4, SV_all4, alpha_vals4, kernel, r);
    yf5 = ycalcNonLinear(x5, x5f, y5f, bias5, SV_all5, alpha_vals5, kernel, r);
    
    er1 = classification_error(yf1, y1);
    er2 = classification_error(yf2, y2);
    er3 = classification_error(yf3, y3);
    er4 = classification_error(yf4, y4);
    er5 = classification_error(yf5, y5);
    
    err = (er1 + er2 + er3 + er4 + er5)/5;
end