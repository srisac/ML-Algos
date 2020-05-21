%%%%%%%%%%%LOAD DATA%%%%%%%%%%%
x10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_10%.txt');
x20 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_20%.txt');
x30 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_30%.txt');
x40 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_40%.txt');
x50 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_50%.txt');
x60 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_60%.txt');
x70 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_70%.txt');
x80 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_80%.txt');
x90 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_90%.txt');
x100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\X_train_100%.txt');
y10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_10%.txt');
y20 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_20%.txt');
y30 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_30%.txt');
y40 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_40%.txt');
y50 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_50%.txt');
y60 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_60%.txt');
y70 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_70%.txt');
y80 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_80%.txt');
y90 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_90%.txt');
y100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\Train-subsets\y_train_100%.txt');

xTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\X_test.txt');
yTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\y_test.txt');
xTrain = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\X_train.txt');
yTrain = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-1\y_train.txt');

%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[w10, b10] = LeastSquaresRegression(x10, y10);
[w20, b20] = LeastSquaresRegression(x20, y20);
[w30, b30] = LeastSquaresRegression(x30, y30);
[w40, b40] = LeastSquaresRegression(x40, y40);
[w50, b50] = LeastSquaresRegression(x50, y50);
[w60, b60] = LeastSquaresRegression(x60, y60);
[w70, b70] = LeastSquaresRegression(x70, y70);
[w80, b80] = LeastSquaresRegression(x80, y80);
[w90, b90] = LeastSquaresRegression(x90, y90);
[w100, b100] = LeastSquaresRegression(x100, y100);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
yHat10 = RegCalculator(w10, b10, x10);
yHat10Test = RegCalculator(w10, b10, xTest);
yHat20 = RegCalculator(w20, b20, x20);
yHat20Test = RegCalculator(w20, b20, xTest);
yHat30 = RegCalculator(w30, b30, x30);
yHat30Test = RegCalculator(w30, b30, xTest);
yHat40 = RegCalculator(w40, b40, x40);
yHat40Test = RegCalculator(w40, b40, xTest);
yHat50 = RegCalculator(w50, b50, x50);
yHat50Test = RegCalculator(w50, b50, xTest);
yHat60 = RegCalculator(w60, b60, x60);
yHat60Test = RegCalculator(w60, b60, xTest);
yHat70 = RegCalculator(w70, b70, x70);
yHat70Test = RegCalculator(w70, b70, xTest);
yHat80 = RegCalculator(w80, b80, x80);
yHat80Test = RegCalculator(w80, b80, xTest);
yHat90 = RegCalculator(w90, b90, x90);
yHat90Test = RegCalculator(w90, b90, xTest);
yHat100 = RegCalculator(w100, b100, x100);
yHat100Test = RegCalculator(w100, b100, xTest);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
training_error = zeros(1, 10);
test_error = zeros(1, 10);

training_error(1, 1) = mean_squared_error(y10, yHat10);
training_error(1, 2) = mean_squared_error(y20, yHat20);
training_error(1, 3) = mean_squared_error(y30, yHat30);
training_error(1, 4) = mean_squared_error(y40, yHat40);
training_error(1, 5) = mean_squared_error(y50, yHat50);
training_error(1, 6) = mean_squared_error(y60, yHat60);
training_error(1, 7) = mean_squared_error(y70, yHat70);
training_error(1, 8) = mean_squared_error(y80, yHat80);
training_error(1, 9) = mean_squared_error(y90, yHat90);
training_error(1, 10) = mean_squared_error(y100, yHat100);

test_error(1, 1) = mean_squared_error(yHat10Test, yTest);
test_error(1, 2) = mean_squared_error(yHat20Test, yTest);
test_error(1, 3) = mean_squared_error(yHat30Test, yTest);
test_error(1, 4) = mean_squared_error(yHat40Test, yTest);
test_error(1, 5) = mean_squared_error(yHat50Test, yTest);
test_error(1, 6) = mean_squared_error(yHat60Test, yTest);
test_error(1, 7) = mean_squared_error(yHat70Test, yTest);
test_error(1, 8) = mean_squared_error(yHat80Test, yTest);
test_error(1, 9) = mean_squared_error(yHat90Test, yTest);
test_error(1, 10) = mean_squared_error(yHat100Test, yTest);

x_axis = zeros(1, 11);
for loop = 0:10
    x_axis(loop) = 0.1*loop;
end

figure
scatter(xTest, yTest);
hold on
plot(xTest, yHat100Test);
hold off

figure
plot(x_axis
