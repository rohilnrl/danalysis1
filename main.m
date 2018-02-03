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

%% Initial processing

m = length(y);
X = [ones(m, 1), X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Set regularization parameter lambda to 1
lambda = 1;

[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);