function err = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, cost, kernel, r)

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
    
    [type1, w1, SV_11, SV_21, SV_31, alphasSV_11, alphasSV_21, alphasSV_31,  bias1] = SVM(x1f, y1f, cost, kernel, r);
    [type2, w2, SV_12, SV_22, SV_32, alphasSV_12, alphasSV_22, alphasSV_32,  bias2] = SVM(x2f, y2f, cost, kernel, r);
    [type3, w3, SV_13, SV_23, SV_33, alphasSV_13, alphasSV_23, alphasSV_33,  bias3] = SVM(x3f, y3f, cost, kernel, r);
    [type4, w4, SV_14, SV_24, SV_34, alphasSV_14, alphasSV_24, alphasSV_34,  bias4] = SVM(x4f, y4f, cost, kernel, r);
    [type5, w5, SV_15, SV_25, SV_35, alphasSV_15, alphasSV_25, alphasSV_35,  bias5] = SVM(x5f, y5f, cost, kernel, r);
    
    yf1 = y_calculator(x1, w1, bias1);
    yf2 = y_calculator(x2, w2, bias2);
    yf3 = y_calculator(x3, w3, bias3);
    yf4 = y_calculator(x4, w4, bias4);
    yf5 = y_calculator(x5, w5, bias5);
    
    er1 = classification_error(yf1, y1);
    er2 = classification_error(yf2, y2);
    er3 = classification_error(yf3, y3);
    er4 = classification_error(yf4, y4);
    er5 = classification_error(yf5, y5);
    
    err = (er1 + er2 + er3 + er4 + er5)/5;
end