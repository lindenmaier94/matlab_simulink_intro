% This script demonstrates how nonlinear equations (systems) can be solved
% by Matlab.
%% Magic Formula (Pacejka slip model)
% All parameters are arbitrary
magicFormulaFcnHandle = @(slip, paramStruct) magicFormula(...
    slip, paramStruct);
% Parameters
% Maximal friction coefficient: D
modelParams.maxFrictionCoeff = 1.0;
% Shape factor: C 
modelParams.shapeFactor = 1.45;
% Stiffness factor: B
modelParams.stiffnessFactor = 15.0;
% Curvature factor: E
modelParams.curvatureFactor = 0.4;
% Function handle of the the current tyre model (with given params)
tireModelFcnHandle = @(slip) magicFormulaFcnHandle(slip, modelParams);

%% Compute the normalized force values (Values of Pacejka slip curve)
% Slip values
slipVector = -1 : 0.01 : 1;
% Normalized lateral force values
normalizedForceValues = tireModelFcnHandle(slipVector);

%% Solving the nonlinear equation
% We are looking for the slip90 value, where mu = m90 = 
% 0.9 * maxFrictionCoeff  mu(s90) = mu90 -> mu(s90) - mu90 = 0
mu90 = 0.9 * modelParams.maxFrictionCoeff;
% The function whose root we are looking for
fcnHandleSlip90 = @(nu) tireModelFcnHandle(nu) - mu90;
% Start the numerical solution from s = 0
[nu90_0, F90_0] = fsolve(fcnHandleSlip90, 0);
% Start the numerical solution from s = 1
[nu90_1, F90_1] = fsolve(fcnHandleSlip90, 1);
% The results:
fprintf(1, 'mu(%g)=%g (from initial point s=%g)\n', nu90_0, mu90 + F90_0, 0);
fprintf(1, 'mu(%g)=%g (from initial point s=%g)\n', nu90_1, mu90 + F90_1, 1);
%% Plotting the results
fig = figure('Name', 'Pacejka slip curve', 'Color', 'White');
ax = axes(fig);
hold(ax, 'on');
grid(ax, 'on');
plot(ax, slipVector, normalizedForceValues, 'b-');
plot(ax, nu90_0, mu90 + F90_0, 'o', 'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'red');
plot(ax, nu90_1, mu90 + F90_1, 'o', 'MarkerFaceColor', 'green', 'MarkerEdgeColor', 'green');
plot(ax, [-1; 1], [mu90; mu90], 'Color', 'black');
plot(ax, [-1; 1], [0; 0], 'Color', 'black', 'LineWidth', 2);
plot(ax, [0; 0], [-1; 1], 'Color', 'black', 'LineWidth', 2);
legend(ax, {'Pacejka slip curve', 'Solutiom from 0', 'Solution from 1'}, ...
    'Location', 'northwest');
xlabel('Slip value [-]');
ylabel('Normalized force [-]');
