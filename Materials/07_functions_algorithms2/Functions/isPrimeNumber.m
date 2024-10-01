function isPrime = isPrimeNumber(number, primeNumbers)

% Let assume that the current number is prime
isPrime = true;

% The biggest possible new divider
biggestDivider = floor(sqrt(number));

% I try all the possible dividers
for iPrime = 1 : numel(primeNumbers)
    if primeNumbers(iPrime) > biggestDivider
        break;
    end
    % If it is divisible by a previous prime, its not prime.
    if mod(number, primeNumbers(iPrime)) == 0
        isPrime = false;
        break;
    end
end
end