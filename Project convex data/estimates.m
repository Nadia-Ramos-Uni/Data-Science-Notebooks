function [mu, Sigma] = estimates(data_file)
%The data is be the daily returns.
%We are expecting the first column of the data file to be the date.

data = readtable(data_file);

R = data{:, 2:end};
mu = mean(R)';

Sigma = cov(R);

%Annual data:

mu = mu * 252;
Sigma = Sigma * 252;

