% Generate simulated data
rng(0); % Set random seed for reproducibility
T = 100; % Number of time steps
t = 1:T; % Time vector

% Simulate the time series
phi = 0.6; % AR parameter
theta = -0.4; % MA parameter
y = zeros(T, 1);
y(1) = randn;
for i = 2:T
    y(i) = phi * y(i-1) + theta * randn;
end

% Specify the ARIMA model order and parameter values
p = 1; % AR order
d = 1; % Degree of differencing
q = 1; % MA order

% Fit the ARIMA model
model = arima(p, d, q);

% Estimate the model parameters
estModel = estimate(model, y);

% Predict future values
horizon = 10; % Number of future time steps to predict
futureValues = forecast(estModel, horizon);

% Create a time vector for future predictions
t_future = t(end) + (1:horizon);

% Plot the original and predicted values
figure;
plot(t, y, 'b', 'LineWidth', 1.5);
hold on;
plot(t_future, futureValues, 'r--', 'LineWidth', 1.5);
hold off;
xlabel('Time');
ylabel('Value');
legend('Original', 'Predicted');
title('ARIMA Forecast');
