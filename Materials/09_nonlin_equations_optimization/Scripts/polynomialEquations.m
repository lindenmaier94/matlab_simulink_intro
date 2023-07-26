% This script demonstrates how one can handle polynomial equations in
% Matlabs
%% Definition of a polynomial with a vector of coefficient
% 6.x^5 - x^4 + 5.x^3 + 2.x^2 - 10.x + 23 
polynomial1 = [6, -1, 5, 2, -10, 23];

%% Roots of the polynomial: p(x) = 0
rootsOfPoly1 = roots(polynomial1)

%% Define the polynomial coefficients by its roots
% The coefficient of the highest degree is 1
polynomialFromRoots = poly(rootsOfPoly1)

%% Compute the values of the polynomial at given points
xVect = -10 : 0.1 : 10;
yVect = polyval(polynomial1, xVect);

%% Multiplication and division with polynomials
% x^2 +5.x + 6
polynomial2 = [1, 5, 6];
productPoly = conv(polynomial1, polynomial2)

[quotientPoly, remainderPoly] = deconv(productPoly, polynomial1)

%% Derivation and integration of polynomials
diffPoly1 = polyder(polynomial1);
diffValuesPoly1 = polyval(diffPoly1, xVect);

integralPoly1 = polyint(polynomial1);
integralValuesPoly1 = polyval(integralPoly1, xVect);

%% Visualization
f = figure('Name', 'Polynomials', 'Color', 'white');
ax = axes(f);
hold(ax, 'on');
plot(ax, xVect, yVect, 'r-');
plot(ax, xVect, diffValuesPoly1, 'g-');
plot(ax, xVect, integralValuesPoly1, 'b-');
grid(ax, 'on');
xlabel('x');
ylabel('p(x)');
legend({'p(x)', 'dp(x)', 'ip(x)'});