function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
   
    h = X * theta;    
    
    %temp0 = theta(1) - alpha/m * sum((h-y).*X(:,1));
    %temp1 = theta(2) - alpha/m * sum((h-y).*X(:,2));
    
    %theta(1) = temp0;
    %theta(2) = temp1;
    
    %also suit for Multi theta
    temp = zeros(1,size(X,2));
    for i = 1:size(X, 2)        
        temp(i) = theta(i) - alpha/m * sum((h-y).*X(:,i));
    end
    
    for i = 1:size(X, 2)        
        theta(i) = temp(i);
    end

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
