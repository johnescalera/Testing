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


%  Setup Variables %
test_values = [0.01 0.03 0.1 0.3 1 3 10 30];
test_length = length(test_values);
min_error = 1;

for i=1:test_length
    for j=1:test_length
        % Current Values %
        C_test = test_values(i);
        sigma_test = test_values(j);
        
        model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test)); % copied from ex6.m %
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions ~= yval));
        if prediction_error < min_error,
            C = C_test;
            sigma = sigma_test;
            min_error = prediction_error;
        end
    end
end

% =========================================================================

end
