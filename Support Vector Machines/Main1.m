X_test = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\X_test.txt');
X_train = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\X_train.txt');
Y_test = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\Y_test.txt');
Y_train = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\Y_train.txt');

x1 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold1\X.txt');
y1 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold1\Y.txt');

x2 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold2\X.txt');
y2 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold2\Y.txt');

x3 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold3\X.txt');
y3 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold3\Y.txt');

x4 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold4\X.txt');
y4 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold4\Y.txt');

x5 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold5\X.txt');
y5 = load('D:\Downloads\ps2_kit\ps2_kit\Problem-1\Synthetic-Dataset\CrossValidation\Fold5\Y.txt');

cvalerrs = zeros(1, 7); %C = -4 to 2

cvalerrs(1, 1) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 0, 1);
cvalerrs(1, 2) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 0, 1);
cvalerrs(1, 3) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 0, 1);
cvalerrs(1, 4) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 0, 1);
cvalerrs(1, 5) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 0, 1);
cvalerrs(1, 6) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 0, 1);
cvalerrs(1, 7) = foldCalc(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 0, 1);

[~, wn4, ~, ~, sv31, ~, ~, ~,  biasn4] = SVM(X_train, Y_train, 0.0001, 0, 0);
[~, wn3, ~, ~, sv32, ~, ~, ~,  biasn3] = SVM(X_train, Y_train, 0.001, 0, 0);
[~, wn2, ~, ~, sv33, ~, ~, ~,  biasn2] = SVM(X_train, Y_train, 0.01, 0, 0);
[~, wn1, ~, ~, sv34, ~, ~, ~,  biasn1] = SVM(X_train, Y_train, 0.1, 0, 0);
[~, w0, ~, ~, sv35, ~, ~, ~,  bias0] = SVM(X_train, Y_train, 1, 0, 0);
[~, w1, ~, ~, sv36, ~, ~, ~,  bias1] = SVM(X_train, Y_train, 10, 0, 0);
[~, w2, ~, ~, sv37, ~, ~, ~,  bias2] = SVM(X_train, Y_train, 100, 0, 0);

trainErr = zeros(1, 7);
testErr = zeros(1, 7);
trainErr(1, 1) = classification_error(y_calculator(X_train, wn4, biasn4), Y_train);
trainErr(1, 2) = classification_error(y_calculator(X_train, wn3, biasn3), Y_train);
trainErr(1, 3) = classification_error(y_calculator(X_train, wn2, biasn2), Y_train);
trainErr(1, 4) = classification_error(y_calculator(X_train, wn1, biasn1), Y_train);
trainErr(1, 5) = classification_error(y_calculator(X_train, w0, bias0), Y_train);
trainErr(1, 6) = classification_error(y_calculator(X_train, w1, bias1), Y_train);
trainErr(1, 7) = classification_error(y_calculator(X_train, w2, bias2), Y_train);

testErr(1, 1) = classification_error(y_calculator(X_test, wn4, biasn4), Y_test);
testErr(1, 2) = classification_error(y_calculator(X_test, wn3, biasn3), Y_test);
testErr(1, 3) = classification_error(y_calculator(X_test, wn2, biasn2), Y_test);
testErr(1, 4) = classification_error(y_calculator(X_test, wn1, biasn1), Y_test);
testErr(1, 5) = classification_error(y_calculator(X_test, w0, bias0), Y_test);
testErr(1, 6) = classification_error(y_calculator(X_test, w1, bias1), Y_test);
testErr(1, 7) = classification_error(y_calculator(X_test, w2, bias2), Y_test);

x_axis = [0, 1, 2, 3, 4, 5, 6];
figure
plot(x_axis, cvalerrs);
hold on
plot(x_axis, trainErr);
hold on
plot(x_axis, testErr);
hold off

allMat = horzcat(X_train, Y_train);
filt1Mat = allMat(allMat(:,3)==1,:);
filtnMat = allMat(allMat(:,3)==-1,:);
xaxisVal = 0:0.01:20;
yaxisVal = (xaxisVal * w1(1, 1) + bias1)*(-1)/w1(2, 1);
%Train boundary
figure
scatter(filt1Mat(:, 1), filt1Mat(:, 2), 'green', 'filled');
hold on
scatter(filtnMat(:, 1), filtnMat(:, 2), 'red', 'filled');
hold on
plot(xaxisVal, yaxisVal);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%poly%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cvalerrs = zeros(5, 7); %C = -4 to 2

cvalerrs(1, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 1, 1);
cvalerrs(1, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 1, 1);
cvalerrs(1, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 1, 1);
cvalerrs(1, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 1, 1);
cvalerrs(1, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 1, 1);
cvalerrs(1, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 1, 1);%%
cvalerrs(1, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 1, 1);


cvalerrs(2, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 1, 2);%%
cvalerrs(2, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 1, 2);
cvalerrs(2, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 1, 2);
cvalerrs(2, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 1, 2);
cvalerrs(2, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 1, 2);
cvalerrs(2, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 1, 2);
cvalerrs(2, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 1, 2);

cvalerrs(3, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 1, 3);
cvalerrs(3, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 1, 3);
cvalerrs(3, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 1, 3);
cvalerrs(3, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 1, 3);
cvalerrs(3, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 1, 3);
cvalerrs(3, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 1, 3);%%
cvalerrs(3, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 1, 3);

cvalerrs(4, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 1, 4);
cvalerrs(4, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 1, 4);
cvalerrs(4, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 1, 4);
cvalerrs(4, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 1, 4);
cvalerrs(4, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 1, 4); %%
cvalerrs(4, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 1, 4);
cvalerrs(4, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 1, 4);

cvalerrs(5, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 1, 5); %%
cvalerrs(5, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 1, 5);
cvalerrs(5, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 1, 5);
cvalerrs(5, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 1, 5);
cvalerrs(5, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 1, 5);
cvalerrs(5, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 1, 5);
cvalerrs(5, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 1, 5);


[~, ~, SV_all1, alpha_vals1, bias1] = NonLinearSVM(X_train, Y_train, 10, 1, 1);
[~, ~, SV_all2, alpha_vals2, bias2] = NonLinearSVM(X_train, Y_train, 0.0001, 1, 2);
[~, ~, SV_all3, alpha_vals3, bias3] = NonLinearSVM(X_train, Y_train, 10, 1, 3);
[~, ~, SV_all4, alpha_vals4, bias4] = NonLinearSVM(X_train, Y_train, 1, 1, 4);
[~, ~, SV_all5, alpha_vals5, bias5] = NonLinearSVM(X_train, Y_train, 0.0001, 1, 5);


trainErr = zeros(1, 5);
testErr = zeros(1, 5);

trainErr(1, 1) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias1, SV_all1, alpha_vals1, 1, 1), Y_train);
trainErr(1, 2) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias2, SV_all2, alpha_vals2, 1, 2), Y_train);
trainErr(1, 3) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias3, SV_all3, alpha_vals3, 1, 3), Y_train);
trainErr(1, 4) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias4, SV_all4, alpha_vals4, 1, 4), Y_train);
trainErr(1, 5) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias5, SV_all5, alpha_vals5, 1, 5), Y_train);

testErr(1, 1) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias1, SV_all1, alpha_vals1, 1, 1), Y_test);
testErr(1, 2) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias2, SV_all2, alpha_vals2, 1, 2), Y_test);
testErr(1, 3) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias3, SV_all3, alpha_vals3, 1, 3), Y_test);
testErr(1, 4) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias4, SV_all4, alpha_vals4, 1, 4), Y_test);
testErr(1, 5) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias5, SV_all5, alpha_vals5, 1, 5), Y_test);

ycalcNonLinear(X_test, X_train, Y_train, bias3, SV_all3, alpha_vals3, 1, 3)

cv_err = [0.425, 0.42, 0.42, 0.42, 0.42];
x_axis = [1, 2, 3, 4, 5];
figure
plot(x_axis, cv_err);
hold on
plot(x_axis, trainErr);
hold on
plot(x_axis, testErr);
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%RBF%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cvalerrs = zeros(5, 7); %C = -4 to 2

cvalerrs(1, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 2, 0.01);
cvalerrs(1, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 2, 0.01);
cvalerrs(1, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 2, 0.01);
cvalerrs(1, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 2, 0.01);
cvalerrs(1, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 2, 0.01);
cvalerrs(1, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 2, 0.01);%%
cvalerrs(1, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 2, 0.01);


cvalerrs(2, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 2, 0.1);%%
cvalerrs(2, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 2, 0.1);
cvalerrs(2, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 2, 0.1);
cvalerrs(2, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 2, 0.1);
cvalerrs(2, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 2, 0.1);
cvalerrs(2, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 2, 0.1);
cvalerrs(2, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 2, 0.1);

cvalerrs(3, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 2, 1);
cvalerrs(3, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 2, 1);
cvalerrs(3, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 2, 1);
cvalerrs(3, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 2, 1);
cvalerrs(3, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 2, 1);
cvalerrs(3, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 2, 1);%%
cvalerrs(3, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 2, 1);

cvalerrs(4, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 2, 10);
cvalerrs(4, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 2, 10);
cvalerrs(4, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 2, 10);
cvalerrs(4, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 2, 10);
cvalerrs(4, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 2, 10); %%
cvalerrs(4, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 2, 10);
cvalerrs(4, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 2, 10);

cvalerrs(5, 1) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.0001, 2, 100); %%
cvalerrs(5, 2) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.001, 2, 100);
cvalerrs(5, 3) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.01, 2, 100);
cvalerrs(5, 4) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 0.1, 2, 100);
cvalerrs(5, 5) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 1, 2, 100);
cvalerrs(5, 6) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 10, 2, 100);
cvalerrs(5, 7) = FoldNonLin(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, 100, 2, 100);


[~, ~, SV_all1, alpha_vals1, bias1] = NonLinearSVM(X_train, Y_train, 0.01, 2, 0.01);
[~, ~, SV_all2, alpha_vals2, bias2] = NonLinearSVM(X_train, Y_train, 1, 2, 0.1);
[~, ~, SV_all3, alpha_vals3, bias3] = NonLinearSVM(X_train, Y_train, 1, 2, 1);
[~, ~, SV_all4, alpha_vals4, bias4] = NonLinearSVM(X_train, Y_train, 1, 2, 10);
[~, ~, SV_all5, alpha_vals5, bias5] = NonLinearSVM(X_train, Y_train, 1, 2, 100);


trainErr = zeros(1, 5);
testErr = zeros(1, 5);

trainErr(1, 1) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias1, SV_all1, alpha_vals1, 2, 1), Y_train);
trainErr(1, 2) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias2, SV_all2, alpha_vals2, 2, 2), Y_train);
trainErr(1, 3) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias3, SV_all3, alpha_vals3, 2, 3), Y_train);
trainErr(1, 4) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias4, SV_all4, alpha_vals4, 2, 4), Y_train);
trainErr(1, 5) = classification_error(ycalcNonLinear(X_train, X_train, Y_train, bias5, SV_all5, alpha_vals5, 2, 5), Y_train);

testErr(1, 1) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias1, SV_all1, alpha_vals1, 2, 1), Y_test);
testErr(1, 2) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias2, SV_all2, alpha_vals2, 2, 2), Y_test);
testErr(1, 3) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias3, SV_all3, alpha_vals3, 2, 3), Y_test);
testErr(1, 4) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias4, SV_all4, alpha_vals4, 2, 4), Y_test);
testErr(1, 5) = classification_error(ycalcNonLinear(X_test, X_train, Y_train, bias5, SV_all5, alpha_vals5, 2, 5), Y_test);

ycalcNonLinear(X_test, X_train, Y_train, bias3, SV_all3, alpha_vals3, 2, 3)

cv_err = [0.44, 0.42, 0.42, 0.43, 0.425];
x_axis = [1, 2, 3, 4, 5];
figure
plot(x_axis, cv_err);
hold on
plot(x_axis, trainErr);
hold on
plot(x_axis, testErr);
hold off
