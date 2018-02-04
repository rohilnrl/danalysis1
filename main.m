clear ; close all; clc

%% Load data

data = csvread('Dataset_Anomaly_p.csv');
X = data(:, 1:end - 1);
y = data(:, end);

n = size(X, 2);

%% Plot data

plotData(X, y, 34, 29);

hold on;

% Labels
xlabel('First training parameter');
ylabel('Second training parameter');

% Legends

legend('Attack', 'Normal')
hold off;

%% =========== Part 1: Regularized Logistic Regression ============

%% Initial processing

m = length(y);
X = [ones(m, 1), X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Set regularization parameter lambda to 1
lambda = 1;

% Compute and display initial cost and gradient for regularized logistic
% regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros) - first five values only:\n');
fprintf(' %f \n', grad(1:5));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


% Compute and display cost and gradient
% with all-ones theta and lambda = 10
test_theta = ones(size(X,2),1);
[cost, grad] = costFunctionReg(test_theta, X, y, 10);

fprintf('\nCost at test theta (with lambda = 10): %f\n', cost);
fprintf('Gradient at test theta - first five values only:\n');
fprintf(' %f \n', grad(1:5));
fprintf('Expected gradients (approx) - first five values only:\n');

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============= Part 2: Regularization and Accuracies =============

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 40;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);
  
% Plot Boundary
% plotDecisionBoundary(theta, X, y);
% hold on;
% title(sprintf('lambda = %g', lambda))

% Labels and Legend
% xlabel('First training parameter');
% ylabel('Second training parameter');

% legend('Attack', 'Normal', 'Decision boundary')
% hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);