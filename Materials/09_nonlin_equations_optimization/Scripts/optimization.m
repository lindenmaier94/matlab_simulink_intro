% This script is intended to introduce optimization by minimum search 
% in Matlab.
%% One dimensional function
% Let's find the minimum of the following function:
% x^2 - 8x + 15 (exact solution x_min = 4) 

% Creating handle of the function above with handle parameter 
% corresponding to the independent variable of the function:
quadraticFcnHandle = @(x) x.^2 - 8 * x + 15;
% Defining the initial point of from what the searching starts:
initialX = 0;
% Performing minimum search
[xMinQuadratic, minValueQuadratic] = fminsearch(quadraticFcnHandle, ...
    initialX);
% Displaying iterations of minimum search:
optimOptions = optimset('Display','iter');
fminsearch(quadraticFcnHandle, initialX, optimOptions);

% Result visualization
figureObject1 = figure;
axisObject1 = axes(figureObject1);

xVect = 0 : 0.01 : 8;
yVect = quadraticFcnHandle(xVect);
plot(xVect, yVect, 'blue', 'LineWidth', 1.5);
hold(axisObject1, 'on')
plot(xMinQuadratic, minValueQuadratic, 'ro', 'LineWidth', 1.5);
hold(axisObject1, 'off')
legend(axisObject1, 'Function', 'Minimum')

%% Multidimensional function
% Let's find the minimum of a Rosenbrock function with a = 1 and b = 100 
% parameters. We implement the function in a separate file: 
% genericRosenbrock.m

% In the case of multidimensional functions, the fminsearch works in the 
% same way, but the independent variables of the function along which 
% the minimum is searched have to be put into a vector. 

aParam = 1;
bParam = 100;
rosenbrockFcnHandle = @(xValues, yValues) genericRosenbrock(...
    xValues, yValues, aParam, bParam);
optimFcnHandle = @(xyValues) rosenbrockFcnHandle(xyValues(1), ...
    xyValues(2));

initialPoint = [0, 0];
[xyMinRosenbrock, minValueRosenbrock] = fminsearch(...
    optimFcnHandle, initialPoint);

% Result visualization
% The two-dimensional functions can be visualized by Matlab surf command. 
% First, the grid representation of the  plane must be created by 
% meshgrid function: 
xVect = -10 : 0.01 : 10;
yVect = -10 : 0.1 : 10;
[xGrid, yGrid] = meshgrid(xVect, yVect);

%The variables xGrid and yGrid are matrices with as many rows and columns
% as many elements are in xVect and yVect, respectively. The corresponding 
% elements of xGrid and yGrid represent the  coordinates of a grid point.

zValuesRosenbrock = rosenbrockFcnHandle(xGrid, yGrid);

figureObject2 = figure;
axisObject2 = axes(figureObject2);
surf(axisObject2, xGrid, yGrid, zValuesRosenbrock, 'EdgeColor', 'none');

% Let's visualize the minimum point of the function with 3D scatter plot: 
hold(axisObject2, 'on')
scatter3(axisObject2, xyMinRosenbrock(1), xyMinRosenbrock(2), ...
    minValueRosenbrock, 'red', 'filled')
hold(axisObject2, 'off')