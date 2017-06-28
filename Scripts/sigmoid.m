function p = sigmoid(x,lamda)
% Sigmoid function: s(x) = 1 / (1+exp(-x))

% This file is from pmtk3.googlecode.com

p = 1./(1+exp(-lamda*x));
end