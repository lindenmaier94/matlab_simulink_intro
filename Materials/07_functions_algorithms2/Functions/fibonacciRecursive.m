function fibonacciValue = fibonacciRecursive(idx)
% This function obtains the n-th element of the Fibonacci series by
% recursive function calling
if idx < 0
    fibonacciValue = NaN;
    warning('Negative index is not interpreted.');
    return
elseif (idx == 0) || (idx == 1)
    % The first two elements of series
    fibonacciValue = idx;
else
    fibonacciValue = fibonacciRecursive(idx - 1) + ...
        fibonacciRecursive(idx - 2);
end
end