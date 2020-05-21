%%%%%%%%%%%LOAD DATA%%%%%%%%%%%
xFullTrain = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\X_train.txt');
yFullTrain = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\y_train.txt');
xFullTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\X_test.txt');
yFullTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\y_test.txt');

%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[L2w7, L2b7] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-7));
[L2w6, L2b6] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-6));
[L2w5, L2b5] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-5));
[L2w4, L2b4] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-4));
[L2w3, L2b3] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-3));
[L2w2, L2b2] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-2));
[L2w1, L2b1] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(-1));
[L2w0, L2b0] = LogisticRegressionL2(xFullTrain, yFullTrain, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
L2w7yHat = yHatCalculator(L2w7, L2b7, xFullTrain);
L2w7yHatTest = yHatCalculator(L2w7, L2b7, xFullTest);
L2w6yHat = yHatCalculator(L2w6, L2b6, xFullTrain);
L2w6yHatTest = yHatCalculator(L2w6, L2b6, xFullTest);
L2w5yHat = yHatCalculator(L2w5, L2b5, xFullTrain);
L2w5yHatTest = yHatCalculator(L2w5, L2b5, xFullTest);
L2w4yHat = yHatCalculator(L2w4, L2b4, xFullTrain);
L2w4yHatTest = yHatCalculator(L2w4, L2b4, xFullTest);
L2w3yHat = yHatCalculator(L2w3, L2b3, xFullTrain);
L2w3yHatTest = yHatCalculator(L2w3, L2b3, xFullTest);
L2w2yHat = yHatCalculator(L2w2, L2b2, xFullTrain);
L2w2yHatTest = yHatCalculator(L2w2, L2b2, xFullTest);
L2w1yHat = yHatCalculator(L2w1, L2b1, xFullTrain);
L2w1yHatTest = yHatCalculator(L2w1, L2b1, xFullTest);
L2w0yHat = yHatCalculator(L2w0, L2b0, xFullTrain);
L2w0yHatTest = yHatCalculator(L2w0, L2b0, xFullTest);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
L2training_error = zeros(1, 8);
L2test_error = zeros(1, 8);

L2training_error(1, 8) = classification_error(L2w7yHat, yFullTrain);
L2training_error(1, 7) = classification_error(L2w6yHat, yFullTrain);
L2training_error(1, 6) = classification_error(L2w5yHat, yFullTrain);
L2training_error(1, 5) = classification_error(L2w4yHat, yFullTrain);
L2training_error(1, 4) = classification_error(L2w3yHat, yFullTrain);
L2training_error(1, 3) = classification_error(L2w2yHat, yFullTrain);
L2training_error(1, 2) = classification_error(L2w1yHat, yFullTrain);
L2training_error(1, 1) = classification_error(L2w0yHat, yFullTrain);

L2test_error(1, 8) = classification_error(L2w7yHatTest, yFullTest);
L2test_error(1, 7) = classification_error(L2w6yHatTest, yFullTest);
L2test_error(1, 6) = classification_error(L2w5yHatTest, yFullTest);
L2test_error(1, 5) = classification_error(L2w4yHatTest, yFullTest);
L2test_error(1, 4) = classification_error(L2w3yHatTest, yFullTest);
L2test_error(1, 3) = classification_error(L2w2yHatTest, yFullTest);
L2test_error(1, 2) = classification_error(L2w1yHatTest, yFullTest);
L2test_error(1, 1) = classification_error(L2w0yHatTest, yFullTest);

x_axis = zeros(1, 8);
for loop = 1:8
    x_axis(loop) = 8-loop;
end

figure
plot(x_axis, L2test_error);
hold on
plot(x_axis, L2training_error);
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xfold1 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold1\X.txt');
xfold2 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold2\X.txt');
xfold3 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold3\X.txt');
xfold4 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold4\X.txt');
xfold5 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold5\X.txt');

yfold1 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold1\y.txt');
yfold2 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold2\y.txt');
yfold3 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold3\y.txt');
yfold4 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold4\y.txt');
yfold5 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Cross-validation\Fold5\y.txt');

xfirstFold = vertcat(xfold2, xfold3, xfold4, xfold5);
xsecondFold = vertcat(xfold1, xfold3, xfold4, xfold5);
xthirdFold = vertcat(xfold1, xfold2, xfold4, xfold5);
xfourthFold = vertcat(xfold1, xfold2, xfold3, xfold5);
xfifthFold = vertcat(xfold1, xfold2, xfold3, xfold4);

yfirstFold = vertcat(yfold2, yfold3, yfold4, yfold5);
ysecondFold = vertcat(yfold1, yfold3, yfold4, yfold5);
ythirdFold = vertcat(yfold1, yfold2, yfold4, yfold5);
yfourthFold = vertcat(yfold1, yfold2, yfold3, yfold5);
yfifthFold = vertcat(yfold1, yfold2, yfold3, yfold4);

%%%%%%%%%%%%%%%FOLD 1%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f1w7, f1b7] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-7));
[f1w6, f1b6] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-6));
[f1w5, f1b5] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-5));
[f1w4, f1b4] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-4));
[f1w3, f1b3] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-3));
[f1w2, f1b2] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-2));
[f1w1, f1b1] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(-1));
[f1w0, f1b0] = LogisticRegressionL2(xfirstFold, yfirstFold, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f1w7yHatTest = yHatCalculator(f1w7, f1b7, xfold1);
f1w6yHatTest = yHatCalculator(f1w6, f1b6, xfold1);
f1w5yHatTest = yHatCalculator(f1w5, f1b5, xfold1);
f1w4yHatTest = yHatCalculator(f1w4, f1b4, xfold1);
f1w3yHatTest = yHatCalculator(f1w3, f1b3, xfold1);
f1w2yHatTest = yHatCalculator(f1w2, f1b2, xfold1);
f1w1yHatTest = yHatCalculator(f1w1, f1b1, xfold1);
f1w0yHatTest = yHatCalculator(f1w0, f1b0, xfold1);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f1test_error = zeros(1, 8);

f1test_error(1, 8) = classification_error(f1w7yHatTest, yfold1);
f1test_error(1, 7) = classification_error(f1w6yHatTest, yfold1);
f1test_error(1, 6) = classification_error(f1w5yHatTest, yfold1);
f1test_error(1, 5) = classification_error(f1w4yHatTest, yfold1);
f1test_error(1, 4) = classification_error(f1w3yHatTest, yfold1);
f1test_error(1, 3) = classification_error(f1w2yHatTest, yfold1);
f1test_error(1, 2) = classification_error(f1w1yHatTest, yfold1);
f1test_error(1, 1) = classification_error(f1w0yHatTest, yfold1);

%%%%%%%%%%%%%%%FOLD 2%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f2w7, f2b7] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-7));
[f2w6, f2b6] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-6));
[f2w5, f2b5] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-5));
[f2w4, f2b4] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-4));
[f2w3, f2b3] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-3));
[f2w2, f2b2] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-2));
[f2w1, f2b1] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(-1));
[f2w0, f2b0] = LogisticRegressionL2(xsecondFold, ysecondFold, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f2w7yHatTest = yHatCalculator(f2w7, f2b7, xfold2);
f2w6yHatTest = yHatCalculator(f2w6, f2b6, xfold2);
f2w5yHatTest = yHatCalculator(f2w5, f2b5, xfold2);
f2w4yHatTest = yHatCalculator(f2w4, f2b4, xfold2);
f2w3yHatTest = yHatCalculator(f2w3, f2b3, xfold2);
f2w2yHatTest = yHatCalculator(f2w2, f2b2, xfold2);
f2w1yHatTest = yHatCalculator(f2w1, f2b1, xfold2);
f2w0yHatTest = yHatCalculator(f2w0, f2b0, xfold2);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f2test_error = zeros(1, 8);

f2test_error(1, 8) = classification_error(f2w7yHatTest, yfold2);
f2test_error(1, 7) = classification_error(f2w6yHatTest, yfold2);
f2test_error(1, 6) = classification_error(f2w5yHatTest, yfold2);
f2test_error(1, 5) = classification_error(f2w4yHatTest, yfold2);
f2test_error(1, 4) = classification_error(f2w3yHatTest, yfold2);
f2test_error(1, 3) = classification_error(f2w2yHatTest, yfold2);
f2test_error(1, 2) = classification_error(f2w1yHatTest, yfold2);
f2test_error(1, 1) = classification_error(f2w0yHatTest, yfold2);

%%%%%%%%%%%%%%%FOLD 3%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f3w7, f3b7] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-7));
[f3w6, f3b6] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-6));
[f3w5, f3b5] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-5));
[f3w4, f3b4] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-4));
[f3w3, f3b3] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-3));
[f3w2, f3b2] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-2));
[f3w1, f3b1] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(-1));
[f3w0, f3b0] = LogisticRegressionL2(xthirdFold, ythirdFold, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f3w7yHatTest = yHatCalculator(f3w7, f3b7, xfold3);
f3w6yHatTest = yHatCalculator(f3w6, f3b6, xfold3);
f3w5yHatTest = yHatCalculator(f3w5, f3b5, xfold3);
f3w4yHatTest = yHatCalculator(f3w4, f3b4, xfold3);
f3w3yHatTest = yHatCalculator(f3w3, f3b3, xfold3);
f3w2yHatTest = yHatCalculator(f3w2, f3b2, xfold3);
f3w1yHatTest = yHatCalculator(f3w1, f3b1, xfold3);
f3w0yHatTest = yHatCalculator(f3w0, f3b0, xfold3);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f3test_error = zeros(1, 8);

f3test_error(1, 8) = classification_error(f3w7yHatTest, yfold3);
f3test_error(1, 7) = classification_error(f3w6yHatTest, yfold3);
f3test_error(1, 6) = classification_error(f3w5yHatTest, yfold3);
f3test_error(1, 5) = classification_error(f3w4yHatTest, yfold3);
f3test_error(1, 4) = classification_error(f3w3yHatTest, yfold3);
f3test_error(1, 3) = classification_error(f3w2yHatTest, yfold3);
f3test_error(1, 2) = classification_error(f3w1yHatTest, yfold3);
f3test_error(1, 1) = classification_error(f3w0yHatTest, yfold3);

%%%%%%%%%%%%%%%FOLD 4%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f4w7, f4b7] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-7));
[f4w6, f4b6] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-6));
[f4w5, f4b5] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-5));
[f4w4, f4b4] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-4));
[f4w3, f4b3] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-3));
[f4w2, f4b2] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-2));
[f4w1, f4b1] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(-1));
[f4w0, f4b0] = LogisticRegressionL2(xfourthFold, yfourthFold, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f4w7yHatTest = yHatCalculator(f4w7, f4b7, xfold4);
f4w6yHatTest = yHatCalculator(f4w6, f4b6, xfold4);
f4w5yHatTest = yHatCalculator(f4w5, f4b5, xfold4);
f4w4yHatTest = yHatCalculator(f4w4, f4b4, xfold4);
f4w3yHatTest = yHatCalculator(f4w3, f4b3, xfold4);
f4w2yHatTest = yHatCalculator(f4w2, f4b2, xfold4);
f4w1yHatTest = yHatCalculator(f4w1, f4b1, xfold4);
f4w0yHatTest = yHatCalculator(f4w0, f4b0, xfold4);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f4test_error = zeros(1, 8);

f4test_error(1, 8) = classification_error(f4w7yHatTest, yfold4);
f4test_error(1, 7) = classification_error(f4w6yHatTest, yfold4);
f4test_error(1, 6) = classification_error(f4w5yHatTest, yfold4);
f4test_error(1, 5) = classification_error(f4w4yHatTest, yfold4);
f4test_error(1, 4) = classification_error(f4w3yHatTest, yfold4);
f4test_error(1, 3) = classification_error(f4w2yHatTest, yfold4);
f4test_error(1, 2) = classification_error(f4w1yHatTest, yfold4);
f4test_error(1, 1) = classification_error(f4w0yHatTest, yfold4);

%%%%%%%%%%%%%%%FOLD 5%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[f5w7, f5b7] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-7));
[f5w6, f5b6] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-6));
[f5w5, f5b5] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-5));
[f5w4, f5b4] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-4));
[f5w3, f5b3] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-3));
[f5w2, f5b2] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-2));
[f5w1, f5b1] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(-1));
[f5w0, f5b0] = LogisticRegressionL2(xfifthFold, yfifthFold, 10^(0));

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
f5w7yHatTest = yHatCalculator(f5w7, f5b7, xfold5);
f5w6yHatTest = yHatCalculator(f5w6, f5b6, xfold5);
f5w5yHatTest = yHatCalculator(f5w5, f5b5, xfold5);
f5w4yHatTest = yHatCalculator(f5w4, f5b4, xfold5);
f5w3yHatTest = yHatCalculator(f5w3, f5b3, xfold5);
f5w2yHatTest = yHatCalculator(f5w2, f5b2, xfold5);
f5w1yHatTest = yHatCalculator(f5w1, f5b1, xfold5);
f5w0yHatTest = yHatCalculator(f5w0, f5b0, xfold5);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
f5test_error = zeros(1, 8);

f5test_error(1, 8) = classification_error(f5w7yHatTest, yfold5);
f5test_error(1, 7) = classification_error(f5w6yHatTest, yfold5);
f5test_error(1, 6) = classification_error(f5w5yHatTest, yfold5);
f5test_error(1, 5) = classification_error(f5w4yHatTest, yfold5);
f5test_error(1, 4) = classification_error(f5w3yHatTest, yfold5);
f5test_error(1, 3) = classification_error(f5w2yHatTest, yfold5);
f5test_error(1, 2) = classification_error(f5w1yHatTest, yfold5);
f5test_error(1, 1) = classification_error(f5w0yHatTest, yfold5);

%%%%%%%%%%%%%%%%%%Avg Errors%%%%%%%%%%%%%%%%%%%%%%%
concat_error = vertcat(f1test_error, f2test_error, f3test_error, f4test_error, f5test_error);
avg_error = zeros(1, 8);
for loop_var = 1:8
    avg_error(1, loop_var) = mean(concat_error(:, loop_var));
end

