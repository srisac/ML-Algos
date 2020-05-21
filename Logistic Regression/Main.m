%%%%%%%%%%%LOAD DATA%%%%%%%%%%%
x10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_10%.txt');
x20 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_20%.txt');
x30 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_30%.txt');
x40 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_40%.txt');
x50 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_50%.txt');
x60 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_60%.txt');
x70 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_70%.txt');
x80 = load('D:\Downloads\ps1_kit\ps9_kit\Problem-4\Spambase\Train-subsets\X_train_80%.txt');
x90 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_90%.txt');
x100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\X_train_100%.txt');
y10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_10%.txt');
y20 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_20%.txt');
y30 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_30%.txt');
y40 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_40%.txt');
y50 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_50%.txt');
y60 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_60%.txt');
y70 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_70%.txt');
y80 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_80%.txt');
y90 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_90%.txt');
y100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\Train-subsets\y_train_100%.txt');
xTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\X_test.txt');
yTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-4\Spambase\y_test.txt');


%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[w10, b10] = LogisticRegression(x10, y10);
[w20, b20] = LogisticRegression(x20, y20);
[w30, b30] = LogisticRegression(x30, y30);
[w40, b40] = LogisticRegression(x40, y40);
[w50, b50] = LogisticRegression(x50, y50);
[w60, b60] = LogisticRegression(x60, y60);
[w70, b70] = LogisticRegression(x70, y70);
[w80, b80] = LogisticRegression(x80, y80);
[w90, b90] = LogisticRegression(x90, y90);
[w100, b100] = LogisticRegression(x100, y100);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
yHat10 = yHatCalculator(w10, b10, x10);
yHat10Test = yHatCalculator(w10, b10, xTest);
yHat20 = yHatCalculator(w20, b20, x20);
yHat20Test = yHatCalculator(w20, b20, xTest);
yHat30 = yHatCalculator(w30, b30, x30);
yHat30Test = yHatCalculator(w30, b30, xTest);
yHat40 = yHatCalculator(w40, b40, x40);
yHat40Test = yHatCalculator(w40, b40, xTest);
yHat50 = yHatCalculator(w50, b50, x50);
yHat50Test = yHatCalculator(w50, b50, xTest);
yHat60 = yHatCalculator(w60, b60, x60);
yHat60Test = yHatCalculator(w60, b60, xTest);
yHat70 = yHatCalculator(w70, b70, x70);
yHat70Test = yHatCalculator(w70, b70, xTest);
yHat80 = yHatCalculator(w80, b80, x80);
yHat80Test = yHatCalculator(w80, b80, xTest);
yHat90 = yHatCalculator(w90, b90, x90);
yHat90Test = yHatCalculator(w90, b90, xTest);
yHat100 = yHatCalculator(w100, b100, x100);
yHat100Test = yHatCalculator(w100, b100, xTest);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
training_error = zeros(1, 10);
test_error = zeros(1, 10);

training_error(1, 1) = classification_error(yHat10, y10);
training_error(1, 2) = classification_error(yHat20, y20);
training_error(1, 3) = classification_error(yHat30, y30);
training_error(1, 4) = classification_error(yHat40, y40);
training_error(1, 5) = classification_error(yHat50, y50);
training_error(1, 6) = classification_error(yHat60, y60);
training_error(1, 7) = classification_error(yHat70, y70);
training_error(1, 8) = classification_error(yHat80, y80);
training_error(1, 9) = classification_error(yHat90, y90);
training_error(1, 10) = classification_error(yHat100, y100);

test_error(1, 1) = classification_error(yHat10Test, yTest);
test_error(1, 2) = classification_error(yHat20Test, yTest);
test_error(1, 3) = classification_error(yHat30Test, yTest);
test_error(1, 4) = classification_error(yHat40Test, yTest);
test_error(1, 5) = classification_error(yHat50Test, yTest);
test_error(1, 6) = classification_error(yHat60Test, yTest);
test_error(1, 7) = classification_error(yHat70Test, yTest);
test_error(1, 8) = classification_error(yHat80Test, yTest);
test_error(1, 9) = classification_error(yHat90Test, yTest);
test_error(1, 10) = classification_error(yHat100Test, yTest);

x_axis = zeros(1, 10);
for loop = 1:10
    x_axis(loop) = 10*loop;
end

figure
plot(x_axis, test_error);
hold on
plot(x_axis, training_error);
hold off



