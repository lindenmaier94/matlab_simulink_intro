% This script initializes the mass-spring-damper Simulink model:
% - defining/loading model parameters
% - loading model input
% The init script is automatically executed before starting the Simulink
% model by setting it as initial script of the model. This can be done by:
% - in the Simulink model right click on blank space
% - click on Model Properties
% - click on Callbacks tab on the pop-up window
% - click on InitFcn
% - type the name of the init script saven in a Matlab file

% Model parameters are loaded from the parameter file
modelParams = load('modelParams.mat');
m = modelParams.MASS; % mass [kg]
d = modelParams.DAMPER_CONST; % damper constant [Ns/m]
s = modelParams.SPRING_CONST; % spring constant [N/m]
% The parameters can be modified manually to check how does it affect the
% simulation results

% We create the state space model representation of the mass-damper-spring
% model:
% State transition matrix for state space representation
A_mds = [  0,    1         % velocity = velocity
         -s/m, -d/m;];     % acceleration (Newton II law)
% Input matrix
B_mds = [  0        % input has no indirect effect to the velocity
         1 / m;];   % acceleration (Newton II law)       

% Loading the input (Force) from file we created in 
% 10_differential_equations/LiveScripts/creatingInputForMds
modelInput = load('mdsInput.mat');