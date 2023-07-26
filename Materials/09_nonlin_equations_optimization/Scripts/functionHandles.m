% Function handles introduction
% Functions handles are beneficial for: 
% - function call with them
% - passing function to an other function as input argument
% - parametrization of functions that have obligatory argument list
% - creating "anonymus" functions that not exist in separate files
%% Create function handles
% Create function handle for a second order polynomial.
secondDegPoly = @ (x, a, b, c) a * x^2 + b * x + c;
% Function handle with fixed a, b, c parameters.
secondDegPoly111 = @(x) secondDegPoly(x, 1, 1, 1);
%% Display results
% Call the function handle with free parameters.
disp(secondDegPoly(2, 1, 1, 1));
% Call the function handle with fixed parameters.
disp(secondDegPoly111(2));
% Pass the function handle to another function to evaluate.
disp(polynomEval(secondDegPoly111, 2));
% Evaluate polynomial with polyval function
disp(polyval([1 1 1], 2));

%% Function handle to use as an input
% Function handle for cosine
cosFun = @(x) cos(x);
% Numerical integration with built in matlab function 
xMin = 0; 
xMax = 2 * pi;
integralValue = integral(cosFun, xMin, xMax);