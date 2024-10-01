% MATLAB bult-in: primes(threshold)
function primeNumbers = primesCustom(threshold)
% This function is intended to find all the prime numbers up to a given
% threshold.

if threshold < 2
    primeNumbers = [];
    return
end

% Allocate vector to store prime numbers:
maxNumOfPrimes = ceil(threshold / 2);
primeNumbers = nan(1, maxNumOfPrimes);

% The smallest prime is 2.
primeNumbers(1) = 2;
numberOfPrimes = 1;
% Investigating the odd numbers
for currentNumber = 3 : 2 : threshold    
    if isPrimeNumber(currentNumber, primeNumbers(1 : numberOfPrimes))
        % save to the prime list
        numberOfPrimes = numberOfPrimes + 1;
        primeNumbers(numberOfPrimes) = currentNumber;
    end
end
% release unused memory
primeNumbers = primeNumbers(1 : numberOfPrimes);
end