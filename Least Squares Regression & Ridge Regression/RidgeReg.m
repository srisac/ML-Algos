%%%%%%%%%%%LOAD DATA%%%%%%%%%%%
x10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\X_train_10%.txt');
x100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\X_train_100%.txt');
y10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\y_train_10%.txt');
y100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\y_train_100%.txt');

xTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\X_test.txt');
yTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\y_test.txt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xfold1_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold1\X_10%.txt');
xfold2_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold2\X_10%.txt');
xfold3_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold3\X_10%.txt');
xfold4_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold4\X_10%.txt');
xfold5_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold5\X_10%.txt');

yfold1_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold1\y_10%.txt');
yfold2_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold2\y_10%.txt');
yfold3_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold3\y_10%.txt');
yfold4_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold4\y_10%.txt');
yfold5_10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold5\y_10%.txt');

xfold1_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold1\X_100%.txt');
xfold2_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold2\X_100%.txt');
xfold3_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold3\X_100%.txt');
xfold4_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold4\X_100%.txt');
xfold5_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold5\X_100%.txt');

yfold1_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold1\y_100%.txt');
yfold2_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold2\y_100%.txt');
yfold3_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold3\y_100%.txt');
yfold4_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold4\y_100%.txt');
yfold5_100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Cross-validation\Fold5\y_100%.txt');

xfirstFold10 = vertcat(xfold2_10, xfold3_10, xfold4_10, xfold5_10);
xsecondFold10 = vertcat(xfold1_10, xfold3_10, xfold4_10, xfold5_10);
xthirdFold10 = vertcat(xfold1_10, xfold2_10, xfold4_10, xfold5_10);
xfourthFold10 = vertcat(xfold1_10, xfold2_10, xfold3_10, xfold5_10);
xfifthFold10 = vertcat(xfold1_10, xfold2_10, xfold3_10, xfold4_10);

yfirstFold10 = vertcat(yfold2_10, yfold3_10, yfold4_10, yfold5_10);
ysecondFold10 = vertcat(yfold1_10, yfold3_10, yfold4_10, yfold5_10);
ythirdFold10 = vertcat(yfold1_10, yfold2_10, yfold4_10, yfold5_10);
yfourthFold10 = vertcat(yfold1_10, yfold2_10, yfold3_10, yfold5_10);
yfifthFold10 = vertcat(yfold1_10, yfold2_10, yfold3_10, yfold4_10);

xfirstFold100 = vertcat(xfold2_100, xfold3_100, xfold4_100, xfold5_100);
xsecondFold100 = vertcat(xfold1_100, xfold3_100, xfold4_100, xfold5_100);
xthirdFold100 = vertcat(xfold1_100, xfold2_100, xfold4_100, xfold5_100);
xfourthFold100 = vertcat(xfold1_100, xfold2_100, xfold3_100, xfold5_100);
xfifthFold100 = vertcat(xfold1_100, xfold2_100, xfold3_100, xfold4_100);

yfirstFold100 = vertcat(yfold2_100, yfold3_100, yfold4_100, yfold5_100);
ysecondFold100 = vertcat(yfold1_100, yfold3_100, yfold4_100, yfold5_100);
ythirdFold100 = vertcat(yfold1_100, yfold2_100, yfold4_100, yfold5_100);
yfourthFold100 = vertcat(yfold1_100, yfold2_100, yfold3_100, yfold5_100);
yfifthFold100 = vertcat(yfold1_100, yfold2_100, yfold3_100, yfold4_100);

%%%%%%%%%%%%%%%FOLD 1%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[w10_1, b10_1] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 0.1);
[w10_2, b10_2] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 1);
[w10_3, b10_3] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 10);
[w10_4, b10_4] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 100);
[w10_5, b10_5] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 500);
[w10_6, b10_6] = LeastSquaresRegressionRegularized(xfirstFold10, yfirstFold10, 1000);

[w100_1, b100_1] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 0.1);
[w100_2, b100_2] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 1);
[w100_3, b100_3] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 10);
[w100_4, b100_4] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 100);
[w100_5, b100_5] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 500);
[w100_6, b100_6] = LeastSquaresRegressionRegularized(xfirstFold100, yfirstFold100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
w1yhat_10 = RegCalculator(w10_1, b10_1, xfold1_10);
w2yhat_10 = RegCalculator(w10_2, b10_2, xfold1_10);
w3yhat_10 = RegCalculator(w10_3, b10_3, xfold1_10);
w4yhat_10 = RegCalculator(w10_4, b10_4, xfold1_10);
w5yhat_10 = RegCalculator(w10_5, b10_5, xfold1_10);
w6yhat_10 = RegCalculator(w10_6, b10_6, xfold1_10);

w1yhat_100 = RegCalculator(w100_1, b100_1, xfold1_100);
w2yhat_100 = RegCalculator(w100_2, b100_2, xfold1_100);
w3yhat_100 = RegCalculator(w100_3, b100_3, xfold1_100);
w4yhat_100 = RegCalculator(w100_4, b100_4, xfold1_100);
w5yhat_100 = RegCalculator(w100_5, b100_5, xfold1_100);
w6yhat_100 = RegCalculator(w100_6, b100_6, xfold1_100);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f1test_error_10 = zeros(1, 6);

f1test_error_10(1, 1) = mean_squared_error(w1yhat_10, yfold1_10);
f1test_error_10(1, 2) = mean_squared_error(w2yhat_10, yfold1_10);
f1test_error_10(1, 3) = mean_squared_error(w3yhat_10, yfold1_10);
f1test_error_10(1, 4) = mean_squared_error(w4yhat_10, yfold1_10);
f1test_error_10(1, 5) = mean_squared_error(w5yhat_10, yfold1_10);
f1test_error_10(1, 6) = mean_squared_error(w6yhat_10, yfold1_10);

f1test_error_100 = zeros(1, 6);

f1test_error_100(1, 1) = mean_squared_error(w1yhat_100, yfold1_100);
f1test_error_100(1, 2) = mean_squared_error(w2yhat_100, yfold1_100);
f1test_error_100(1, 3) = mean_squared_error(w3yhat_100, yfold1_100);
f1test_error_100(1, 4) = mean_squared_error(w4yhat_100, yfold1_100);
f1test_error_100(1, 5) = mean_squared_error(w5yhat_100, yfold1_100);
f1test_error_100(1, 6) = mean_squared_error(w6yhat_100, yfold1_100);

%%%%%%%%%%%%%%%FOLD 2%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f2w10_1, f2b10_1] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 0.1);
[f2w10_2, f2b10_2] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 1);
[f2w10_3, f2b10_3] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 10);
[f2w10_4, f2b10_4] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 100);
[f2w10_5, f2b10_5] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 500);
[f2w10_6, f2b10_6] = LeastSquaresRegressionRegularized(xsecondFold10, ysecondFold10, 1000);

[f2w100_1, f2b100_1] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 0.1);
[f2w100_2, f2b100_2] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 1);
[f2w100_3, f2b100_3] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 10);
[f2w100_4, f2b100_4] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 100);
[f2w100_5, f2b100_5] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 500);
[f2w100_6, f2b100_6] = LeastSquaresRegressionRegularized(xsecondFold100, ysecondFold100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f2w1yhat_10 = RegCalculator(f2w10_1, f2b10_1, xfold2_10);
f2w2yhat_10 = RegCalculator(f2w10_2, f2b10_2, xfold2_10);
f2w3yhat_10 = RegCalculator(f2w10_3, f2b10_3, xfold2_10);
f2w4yhat_10 = RegCalculator(f2w10_4, f2b10_4, xfold2_10);
f2w5yhat_10 = RegCalculator(f2w10_5, f2b10_5, xfold2_10);
f2w6yhat_10 = RegCalculator(f2w10_6, f2b10_6, xfold2_10);

f2w1yhat_100 = RegCalculator(f2w100_1, f2b100_1, xfold2_100);
f2w2yhat_100 = RegCalculator(f2w100_2, f2b100_2, xfold2_100);
f2w3yhat_100 = RegCalculator(f2w100_3, f2b100_3, xfold2_100);
f2w4yhat_100 = RegCalculator(f2w100_4, f2b100_4, xfold2_100);
f2w5yhat_100 = RegCalculator(f2w100_5, f2b100_5, xfold2_100);
f2w6yhat_100 = RegCalculator(f2w100_6, f2b100_6, xfold2_100);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f2test_error_10 = zeros(1, 6);

f2test_error_10(1, 1) = mean_squared_error(f2w1yhat_10, yfold2_10);
f2test_error_10(1, 2) = mean_squared_error(f2w2yhat_10, yfold2_10);
f2test_error_10(1, 3) = mean_squared_error(f2w3yhat_10, yfold2_10);
f2test_error_10(1, 4) = mean_squared_error(f2w4yhat_10, yfold2_10);
f2test_error_10(1, 5) = mean_squared_error(f2w5yhat_10, yfold2_10);
f2test_error_10(1, 6) = mean_squared_error(f2w6yhat_10, yfold2_10);

f2test_error_100 = zeros(1, 6);

f2test_error_100(1, 1) = mean_squared_error(f2w1yhat_100, yfold2_100);
f2test_error_100(1, 2) = mean_squared_error(f2w2yhat_100, yfold2_100);
f2test_error_100(1, 3) = mean_squared_error(f2w3yhat_100, yfold2_100);
f2test_error_100(1, 4) = mean_squared_error(f2w4yhat_100, yfold2_100);
f2test_error_100(1, 5) = mean_squared_error(f2w5yhat_100, yfold2_100);
f2test_error_100(1, 6) = mean_squared_error(f2w6yhat_100, yfold2_100);


%%%%%%%%%%%%%%%FOLD 3%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f3w10_1, f3b10_1] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 0.1);
[f3w10_2, f3b10_2] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 1);
[f3w10_3, f3b10_3] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 10);
[f3w10_4, f3b10_4] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 100);
[f3w10_5, f3b10_5] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 500);
[f3w10_6, f3b10_6] = LeastSquaresRegressionRegularized(xthirdFold10, ythirdFold10, 1000);

[f3w100_1, f3b100_1] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 0.1);
[f3w100_2, f3b100_2] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 1);
[f3w100_3, f3b100_3] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 10);
[f3w100_4, f3b100_4] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 100);
[f3w100_5, f3b100_5] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 500);
[f3w100_6, f3b100_6] = LeastSquaresRegressionRegularized(xthirdFold100, ythirdFold100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f3w1yhat_10 = RegCalculator(f3w10_1, f3b10_1, xfold3_10);
f3w2yhat_10 = RegCalculator(f3w10_2, f3b10_2, xfold3_10);
f3w3yhat_10 = RegCalculator(f3w10_3, f3b10_3, xfold3_10);
f3w4yhat_10 = RegCalculator(f3w10_4, f3b10_4, xfold3_10);
f3w5yhat_10 = RegCalculator(f3w10_5, f3b10_5, xfold3_10);
f3w6yhat_10 = RegCalculator(f3w10_6, f3b10_6, xfold3_10);

f3w1yhat_100 = RegCalculator(f3w100_1, f3b100_1, xfold3_100);
f3w2yhat_100 = RegCalculator(f3w100_2, f3b100_2, xfold3_100);
f3w3yhat_100 = RegCalculator(f3w100_3, f3b100_3, xfold3_100);
f3w4yhat_100 = RegCalculator(f3w100_4, f3b100_4, xfold3_100);
f3w5yhat_100 = RegCalculator(f3w100_5, f3b100_5, xfold3_100);
f3w6yhat_100 = RegCalculator(f3w100_6, f3b100_6, xfold3_100);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f3test_error_10 = zeros(1, 6);

f3test_error_10(1, 1) = mean_squared_error(f3w1yhat_10, yfold3_10);
f3test_error_10(1, 2) = mean_squared_error(f3w2yhat_10, yfold3_10);
f3test_error_10(1, 3) = mean_squared_error(f3w3yhat_10, yfold3_10);
f3test_error_10(1, 4) = mean_squared_error(f3w4yhat_10, yfold3_10);
f3test_error_10(1, 5) = mean_squared_error(f3w5yhat_10, yfold3_10);
f3test_error_10(1, 6) = mean_squared_error(f3w6yhat_10, yfold3_10);

f3test_error_100 = zeros(1, 6);

f3test_error_100(1, 1) = mean_squared_error(f3w1yhat_100, yfold3_100);
f3test_error_100(1, 2) = mean_squared_error(f3w2yhat_100, yfold3_100);
f3test_error_100(1, 3) = mean_squared_error(f3w3yhat_100, yfold3_100);
f3test_error_100(1, 4) = mean_squared_error(f3w4yhat_100, yfold3_100);
f3test_error_100(1, 5) = mean_squared_error(f3w5yhat_100, yfold3_100);
f3test_error_100(1, 6) = mean_squared_error(f3w6yhat_100, yfold3_100);


%%%%%%%%%%%%%%%FOLD 4%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f4w10_1, f4b10_1] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 0.1);
[f4w10_2, f4b10_2] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 1);
[f4w10_3, f4b10_3] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 10);
[f4w10_4, f4b10_4] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 100);
[f4w10_5, f4b10_5] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 500);
[f4w10_6, f4b10_6] = LeastSquaresRegressionRegularized(xfourthFold10, yfourthFold10, 1000);

[f4w100_1, f4b100_1] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 0.1);
[f4w100_2, f4b100_2] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 1);
[f4w100_3, f4b100_3] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 10);
[f4w100_4, f4b100_4] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 100);
[f4w100_5, f4b100_5] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 500);
[f4w100_6, f4b100_6] = LeastSquaresRegressionRegularized(xfourthFold100, yfourthFold100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f4w1yhat_10 = RegCalculator(f4w10_1, f4b10_1, xfold4_10);
f4w2yhat_10 = RegCalculator(f4w10_2, f4b10_2, xfold4_10);
f4w3yhat_10 = RegCalculator(f4w10_3, f4b10_3, xfold4_10);
f4w4yhat_10 = RegCalculator(f4w10_4, f4b10_4, xfold4_10);
f4w5yhat_10 = RegCalculator(f4w10_5, f4b10_5, xfold4_10);
f4w6yhat_10 = RegCalculator(f4w10_6, f4b10_6, xfold4_10);

f4w1yhat_100 = RegCalculator(f4w100_1, f4b100_1, xfold4_100);
f4w2yhat_100 = RegCalculator(f4w100_2, f4b100_2, xfold4_100);
f4w3yhat_100 = RegCalculator(f4w100_3, f4b100_3, xfold4_100);
f4w4yhat_100 = RegCalculator(f4w100_4, f4b100_4, xfold4_100);
f4w5yhat_100 = RegCalculator(f4w100_5, f4b100_5, xfold4_100);
f4w6yhat_100 = RegCalculator(f4w100_6, f4b100_6, xfold4_100);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f4test_error_10 = zeros(1, 6);

f4test_error_10(1, 1) = mean_squared_error(f4w1yhat_10, yfold4_10);
f4test_error_10(1, 2) = mean_squared_error(f4w2yhat_10, yfold4_10);
f4test_error_10(1, 3) = mean_squared_error(f4w3yhat_10, yfold4_10);
f4test_error_10(1, 4) = mean_squared_error(f4w4yhat_10, yfold4_10);
f4test_error_10(1, 5) = mean_squared_error(f4w5yhat_10, yfold4_10);
f4test_error_10(1, 6) = mean_squared_error(f4w6yhat_10, yfold4_10);

f4test_error_100 = zeros(1, 6);

f4test_error_100(1, 1) = mean_squared_error(f4w1yhat_100, yfold4_100);
f4test_error_100(1, 2) = mean_squared_error(f4w2yhat_100, yfold4_100);
f4test_error_100(1, 3) = mean_squared_error(f4w3yhat_100, yfold4_100);
f4test_error_100(1, 4) = mean_squared_error(f4w4yhat_100, yfold4_100);
f4test_error_100(1, 5) = mean_squared_error(f4w5yhat_100, yfold4_100);
f4test_error_100(1, 6) = mean_squared_error(f4w6yhat_100, yfold4_100);


%%%%%%%%%%%%%%%FOLD 4%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f5w10_1, f5b10_1] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 0.1);
[f5w10_2, f5b10_2] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 1);
[f5w10_3, f5b10_3] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 10);
[f5w10_4, f5b10_4] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 100);
[f5w10_5, f5b10_5] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 500);
[f5w10_6, f5b10_6] = LeastSquaresRegressionRegularized(xfifthFold10, yfifthFold10, 1000);

[f5w100_1, f5b100_1] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 0.1);
[f5w100_2, f5b100_2] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 1);
[f5w100_3, f5b100_3] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 10);
[f5w100_4, f5b100_4] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 100);
[f5w100_5, f5b100_5] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 500);
[f5w100_6, f5b100_6] = LeastSquaresRegressionRegularized(xfifthFold100, yfifthFold100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f5w1yhat_10 = RegCalculator(f5w10_1, f5b10_1, xfold5_10);
f5w2yhat_10 = RegCalculator(f5w10_2, f5b10_2, xfold5_10);
f5w3yhat_10 = RegCalculator(f5w10_3, f5b10_3, xfold5_10);
f5w4yhat_10 = RegCalculator(f5w10_4, f5b10_4, xfold5_10);
f5w5yhat_10 = RegCalculator(f5w10_5, f5b10_5, xfold5_10);
f5w6yhat_10 = RegCalculator(f5w10_6, f5b10_6, xfold5_10);

f5w1yhat_100 = RegCalculator(f5w100_1, f5b100_1, xfold5_100);
f5w2yhat_100 = RegCalculator(f5w100_2, f5b100_2, xfold5_100);
f5w3yhat_100 = RegCalculator(f5w100_3, f5b100_3, xfold5_100);
f5w4yhat_100 = RegCalculator(f5w100_4, f5b100_4, xfold5_100);
f5w5yhat_100 = RegCalculator(f5w100_5, f5b100_5, xfold5_100);
f5w6yhat_100 = RegCalculator(f5w100_6, f5b100_6, xfold5_100);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f5test_error_10 = zeros(1, 6);

f5test_error_10(1, 1) = mean_squared_error(f5w1yhat_10, yfold5_10);
f5test_error_10(1, 2) = mean_squared_error(f5w2yhat_10, yfold5_10);
f5test_error_10(1, 3) = mean_squared_error(f5w3yhat_10, yfold5_10);
f5test_error_10(1, 4) = mean_squared_error(f5w4yhat_10, yfold5_10);
f5test_error_10(1, 5) = mean_squared_error(f5w5yhat_10, yfold5_10);
f5test_error_10(1, 6) = mean_squared_error(f5w6yhat_10, yfold5_10);

f5test_error_100 = zeros(1, 6);

f5test_error_100(1, 1) = mean_squared_error(f5w1yhat_100, yfold5_100);
f5test_error_100(1, 2) = mean_squared_error(f5w2yhat_100, yfold5_100);
f5test_error_100(1, 3) = mean_squared_error(f5w3yhat_100, yfold5_100);
f5test_error_100(1, 4) = mean_squared_error(f5w4yhat_100, yfold5_100);
f5test_error_100(1, 5) = mean_squared_error(f5w5yhat_100, yfold5_100);
f5test_error_100(1, 6) = mean_squared_error(f5w6yhat_100, yfold5_100);

%%%%%%%%%%%%%%%%%%Avg Errors%%%%%%%%%%%%%%%%%%%%%%%
concat_error_10 = vertcat(f1test_error_10, f2test_error_10, f3test_error_10, f4test_error_10, f5test_error_10);
concat_error_100 = vertcat(f1test_error_100, f2test_error_100, f3test_error_100, f4test_error_100, f5test_error_100);
avg_error_10 = zeros(1, 6);
avg_error_100 = zeros(1, 6);
for loop_var = 1:6
    avg_error_10(1, loop_var) = mean(concat_error_10(:, loop_var));
    avg_error_100(1, loop_var) = mean(concat_error_100(:, loop_var));
end
lambda = zeros(1, 6);
lambda(1, 1) = 0.1;
lambda(1, 2) = 1;
lambda(1, 3) = 10;
lambda(1, 4) = 100;
lambda(1, 5) = 500;
lambda(1, 6) = 1000;

%%%%%%%%%%%%All Vals%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[w1_10, b1_10] = LeastSquaresRegressionRegularized(x10, y10, 0.1);
[w2_10, b2_10] = LeastSquaresRegressionRegularized(x10, y10, 1);
[w3_10, b3_10] = LeastSquaresRegressionRegularized(x10, y10, 10);
[w4_10, b4_10] = LeastSquaresRegressionRegularized(x10, y10, 100);
[w5_10, b5_10] = LeastSquaresRegressionRegularized(x10, y10, 500);
[w6_10, b6_10] = LeastSquaresRegressionRegularized(x10, y10, 1000);
[w1_100, b1_100] = LeastSquaresRegressionRegularized(x100, y100, 0.1);
[w2_100, b2_100] = LeastSquaresRegressionRegularized(x100, y100, 1);
[w3_100, b3_100] = LeastSquaresRegressionRegularized(x100, y100, 10);
[w4_100, b4_100] = LeastSquaresRegressionRegularized(x100, y100, 100);
[w5_100, b5_100] = LeastSquaresRegressionRegularized(x100, y100, 500);
[w6_100, b6_100] = LeastSquaresRegressionRegularized(x100, y100, 1000);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
yHatt1_10 = RegCalculator(w1_10, b1_10, x10);
yHatt2_10 = RegCalculator(w2_10, b2_10, x10);
yHatt3_10 = RegCalculator(w3_10, b3_10, x10);
yHatt4_10 = RegCalculator(w4_10, b4_10, x10);
yHatt5_10 = RegCalculator(w5_10, b5_10, x10);
yHatt6_10 = RegCalculator(w6_10, b6_10, x10);

yHats1_10 = RegCalculator(w1_10, b1_10, xTest);
yHats2_10 = RegCalculator(w2_10, b2_10, xTest);
yHats3_10 = RegCalculator(w3_10, b3_10, xTest);
yHats4_10 = RegCalculator(w4_10, b4_10, xTest);
yHats5_10 = RegCalculator(w5_10, b5_10, xTest);
yHats6_10 = RegCalculator(w6_10, b6_10, xTest);

yHatt1_100 = RegCalculator(w1_100, b1_100, x100);
yHatt2_100 = RegCalculator(w2_100, b2_100, x100);
yHatt3_100 = RegCalculator(w3_100, b3_100, x100);
yHatt4_100 = RegCalculator(w4_100, b4_100, x100);
yHatt5_100 = RegCalculator(w5_100, b5_100, x100);
yHatt6_100 = RegCalculator(w6_100, b6_100, x100);

yHats1_100 = RegCalculator(w1_100, b1_100, xTest);
yHats2_100 = RegCalculator(w2_100, b2_100, xTest);
yHats3_100 = RegCalculator(w3_100, b3_100, xTest);
yHats4_100 = RegCalculator(w4_100, b4_100, xTest);
yHats5_100 = RegCalculator(w5_100, b5_100, xTest);
yHats6_100 = RegCalculator(w6_100, b6_100, xTest);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
training_errors_10 = zeros(1, 6);
test_errors_10 = zeros(1, 6);

training_errors_10(1, 1) = mean_squared_error(y10, yHatt1_10);
training_errors_10(1, 2) = mean_squared_error(y10, yHatt2_10);
training_errors_10(1, 3) = mean_squared_error(y10, yHatt3_10);
training_errors_10(1, 4) = mean_squared_error(y10, yHatt4_10);
training_errors_10(1, 5) = mean_squared_error(y10, yHatt5_10);
training_errors_10(1, 6) = mean_squared_error(y10, yHatt6_10);

test_errors_10(1, 1) = mean_squared_error(yTest, yHats1_10);
test_errors_10(1, 2) = mean_squared_error(yTest, yHats2_10);
test_errors_10(1, 3) = mean_squared_error(yTest, yHats3_10);
test_errors_10(1, 4) = mean_squared_error(yTest, yHats4_10);
test_errors_10(1, 5) = mean_squared_error(yTest, yHats5_10);
test_errors_10(1, 6) = mean_squared_error(yTest, yHats6_10);

training_errors_100 = zeros(1, 6);
test_errors_100 = zeros(1, 6);


training_errors_100(1, 1) = mean_squared_error(y100, yHatt1_100);
training_errors_100(1, 2) = mean_squared_error(y100, yHatt2_100);
training_errors_100(1, 3) = mean_squared_error(y100, yHatt3_100);
training_errors_100(1, 4) = mean_squared_error(y100, yHatt4_100);
training_errors_100(1, 5) = mean_squared_error(y100, yHatt5_100);
training_errors_100(1, 6) = mean_squared_error(y100, yHatt6_100);

test_errors_100(1, 1) = mean_squared_error(yTest, yHats1_100);
test_errors_100(1, 2) = mean_squared_error(yTest, yHats2_100);
test_errors_100(1, 3) = mean_squared_error(yTest, yHats3_100);
test_errors_100(1, 4) = mean_squared_error(yTest, yHats4_100);
test_errors_100(1, 5) = mean_squared_error(yTest, yHats5_100);
test_errors_100(1, 6) = mean_squared_error(yTest, yHats6_100);


figure
plot(lambda, avg_error_10);
hold on
plot(lambda, training_errors_10);
hold on
plot(lambda, test_errors_10);
hold off

figure
plot(lambda, avg_error_100);
hold on
plot(lambda, training_errors_100);
hold on
plot(lambda, test_errors_100);
hold off


