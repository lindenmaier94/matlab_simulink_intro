%% Rosenbrock function
% https://en.wikipedia.org/wiki/Rosenbrock_function
rsb = @(a, b, x, y) (a - x).^2 + b .* (y - x.^2).^2;
rsbp = @(x, y) rsb(1, 100, x, y);

%% Evaluating the function over the x-y plane
% Resolution
circleRadius = 0.5;
% Limes
lim = 10;
% Creating a grid
[xPoints, yPoints] = meshgrid(-lim:circleRadius:lim, -lim:circleRadius:5*lim);
% Computing function values
zValues = rsbp(xPoints, yPoints);

%% Computing function values on the circle boundary
% Parameters
circleRadius = 3;
xCenter = 1;
yCenter = 2;
% Function values on the circle boundary
alpha = 0 : 0.1*pi : 2.0 * pi;
xBoundaryPoints = circleRadius * sin(alpha) + xCenter;
yBoundaryPoints = circleRadius * cos(alpha) + yCenter;
zBoundaryValues = rsbp(xBoundaryPoints, yBoundaryPoints);
%% Optimization
% Optimization options
optimOpts = optimoptions('fmincon',...
                    'Algorithm', 'interior-point',...
                    'Display', 'iter',...
                    'OptimalityTolerance', 1e-6);
% Initial estimate
X0 = [0, 0];
% Conditional function (optimum value should be within the circle)
% The input values of the circle is replaced by the X vector variable
conditionFcnHandle = @(X) withinCircle(circleRadius, xCenter, yCenter, ...
    X(1), X(2));
% Optimized Rosenbrock function
optimFcnHandle = @(X) rsbp(X(1), X(2));
% Run optimization
[optimPlace, optimValue] = fmincon(optimFcnHandle, X0, ...
    [], [], [], [], [], [], ...
    conditionFcnHandle, optimOpts);

%% Plotting the results
fig = figure();
ax = axes(fig);
hold(ax, 'on');
box(ax, 'on');
% Surface
surf(ax, xPoints, yPoints, zValues, ...
    'EdgeColor', 'interp', 'FaceColor', 'interp');
% Circle boundary
plot3(xBoundaryPoints, yBoundaryPoints, zBoundaryValues, 'r-', ...
    'LineWidth', 3);
% Optimum point
plot3(optimPlace(1), optimPlace(2), optimValue, 'go', ...
    'MarkerFaceColor', 'g');

% Setting view options (azimuth, elevation)
view([-20, 47]);

%% Boundary function -> the optimum value is searched within this function
function [c, ceq] = withinCircle(radius, circleCenterX, circleCenterY, ...
    xPoints, yPoints)
% The x-y optimum point should be within the circle defined by its 
% radius and center point (xo-yo)
% The square of the distance from the circle center should be less than the
% square of the circle radius (satisfies that the optimum will be within the circle)
% (x - xo)^2 + (y - yo)^2 <= r^2
% (x - xo)^2 + (y - yo)^2 - r^2 <= 0
ceq = (xPoints - circleCenterX)^2 + ...
    (yPoints - circleCenterY)^2 - radius^2; 
% if this value is less than 0, the optimum value will be witih the circle
c = []; % No equality condition
end