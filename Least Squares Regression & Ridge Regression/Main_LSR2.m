%%%%%%%%%%%LOAD DATA%%%%%%%%%%%
x10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\X_train_10%.txt');
x100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\X_train_100%.txt');
y10 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\y_train_10%.txt');
y100 = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\Train-subsets\y_train_100%.txt');

xTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\X_test.txt');
yTest = load('D:\Downloads\ps1_kit\ps1_kit\Problem-6\Data-set-2\y_test.txt');

%%%%%%%%%%%%%%%%PERFORM REGRESSION%%%%%%%%%%%%%%%%%
[w10, b10] = LeastSquaresRegression(x10, y10);
[w100, b100] = LeastSquaresRegression(x100, y100);

%%%%%%%%%%%%%%%FIND Y-HAT%%%%%%%%%%%%%%%%%%%%%%
yHat10 = RegCalculator(w10, b10, x10);
yHat10Test = RegCalculator(w10, b10, xTest);
yHat100 = RegCalculator(w100, b100, x100);
yHat100Test = RegCalculator(w100, b100, xTest);

%%%%%%%%%%%%%CALCULATE ERROR%%%%%%%%%%%%%%%%%%
training_error = zeros(1, 2);
test_error = zeros(1, 2);

training_error(1, 1) = mean_squared_error(y10, yHat10);
training_error(1, 2) = mean_squared_error(y100, yHat100);

test_error(1, 1) = mean_squared_error(yHat10Test, yTest);
test_error(1, 2) = mean_squared_error(yHat100Test, yTest);

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
