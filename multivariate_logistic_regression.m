%  A simple (but inspiring) example of multivariate logistic regression, where we 
%  predict whether sentences are legitimate sentences of sentential logic or not.
%  Full explanation here: 

clear; close all; clc;

%  Upload the data
load translations.txt
x1 = translations(:, 1);
x2 = translations(:, 2);
x3 = translations(:, 3);
x4 = translations(:, 4);
x5 = translations(:, 5);
x6 = translations(:, 6);
x7 = translations(:, 7);
x8 = translations(:, 8);

load legitimacyvalues.txt
y = legitimacyvalues;

fprintf('\nData is uploaded.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%  Make design matrix
X = [ones(length(x1),1), x1, x2, x3, x4, x5, x6, x7, x8]
theta = zeros(9, 1)

fprintf('\nThere is our design matrix and initial values for theta.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%  Declare relevant functions
function g = sigmoid(z)
g = 1 ./ (1 + e .^ -z);
end;

function J = cost(X, y, theta)
m = length(y);
predictions = sigmoid(X * theta); 
J = 1/m * (-y'*log(predictions) - (1-y)' * log(1-predictions)); 
end;

function [J, theta] = gradientDescent(X, y, theta, alpha, i)
m = length(y);
J = zeros(i, 1);
for a=1:i
  predictions = sigmoid(X * theta);
  grad = (X' * (predictions - y)) / m;
  theta = theta - alpha * grad;
  J(a) = cost(X, y, theta);
end;
end;

%  Run gradient descent (best when alpha=.03 here) 
[j, t] = gradientDescent(X, y, theta, .03, 1500)
theta = t

fprintf('\nRan gradient descent, declared optimal values for theta.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%  Show predictions for training data
predictions = sigmoid(X * theta) >= .5;
[y, predictions]
accuracy = sum(y==predictions) / length(y)

fprintf('\nThere is the actual output, our predicted output, and the accuracy of our model.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%  Test model with testing data
load translations_2.txt
x1 = translations_2(:, 1);
x2 = translations_2(:, 2);
x3 = translations_2(:, 3);
x4 = translations_2(:, 4);
x5 = translations_2(:, 5);
x6 = translations_2(:, 6);
x7 = translations_2(:, 7);
x8 = translations_2(:, 8);

load legitimacyvalues_2.txt
y = legitimacyvalues_2;

X = [ones(length(x1),1),x1,x2,x3,x4,x5,x6,x7,x8];

fprintf('\nUploaded new data for testing.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

predictions = sigmoid(X * theta) >= .5;
[y, predictions]
accuracy = sum(y==predictions) / length(y)

fprintf('\nThere is the actual output, our predicted output, and the accuracy of our model, for the training data. Pretty good!\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
