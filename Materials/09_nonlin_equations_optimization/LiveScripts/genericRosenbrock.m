function funcValueZ = genericRosenbrock(xValue, yValue, aParam, bParam)
% The Rosenbrock function is test function for numerical optimization
% solvers.

funcValueZ = (aParam - xValue).^2 + bParam * (yValue - xValue.^2).^2;
end