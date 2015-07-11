function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
error = zeros(length(C_test),length(sigma_test));
i=1;
for C = C_test
    j=1;
    for sigma = sigma_test  
        model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
        predictions = svmPredict(model, Xval);
        error(i,j) = mean(double(predictions ~= yval));
        j=j+1;
    end
    i=i+1;
end

[i, j] = find(error == min(min(error)));
C = C_test(i);
sigma = sigma_test(j);   

% =========================================================================

end
