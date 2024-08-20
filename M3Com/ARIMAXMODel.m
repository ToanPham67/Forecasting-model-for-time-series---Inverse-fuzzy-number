% Load your time series data
% load('data.mat'); % Replace 'data.mat' with your own data file
% 
% % Define the exogenous variables (X)
% X = [exog_var1, exog_var2, exog_var3]; % Replace exog_var1, exog_var2, exog_var3 with your own exogenous variables
% 
% % Create a time series object
% ts = timeseries(y, t); % Replace 'y' with your time series data and 't' with the corresponding time vector
clc
clear all
load Yearlytraining
data=Yearly;
testdata=[];
 for h=1:645 % size(data,2)
     da=data(h,:);
     NA=isnan(da)';
  y = da(~NA)';
p = 0; % AR order
d = 1; % Degree of differencing
q = 1; % MA order

% Fit the ARIMA model
model = arima(p, d, q);

% Estimate the model parameters
estModel = estimate(model, y);

% Predict future values
horizon = 6; % Number of future time steps to predict
futureValues = forecast(estModel, horizon);
futureValues=futureValues';
testdata=[testdata;futureValues];

 end
 load Yearlytest
for i=1:size(testdata,1)
KQDB=testdata(i,:);
thucte=Yearlytest(i,:);
SMAPE(i,:)=mean((abs(KQDB-thucte)/((KQDB+thucte)/2))*100);
end
ESMAPE=mean(SMAPE)
% Plot the original and predicted values
% figure;
% plot(ts, 'b', 'LineWidth', 1.5);
% hold on;
% t_future = t(end) + (1:horizon); % Generate future time vector
% plot(t_future, futureValues, 'r--', 'LineWidth', 1.5);
% hold off;
% xlabel('Time');
% ylabel('Value');
% legend('Original', 'Predicted');
% title('ARIMAX Forecast');
