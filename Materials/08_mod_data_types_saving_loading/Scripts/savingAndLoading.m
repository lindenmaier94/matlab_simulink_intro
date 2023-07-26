% This script is intended to introduce how you can save data created in
% Matlab and load external data into Matlab.

%% Data definition
% Create data for saving
randomMatrix = rand(10);
randomVector = rand(1, 10);

pokemon = struct();
pokemon.name = 'Charizard';
pokemon.type = 'fire';
pokemon.xp = 10;

%% Saving
% Save all variables in the workspace to a MAT file
save('dataAll.mat');
% Saving specific variables to a MAT file
save('vecotrData.mat', 'randomVector');
% Save specific variables into TXT file
save('matrixData.txt', 'randomMatrix', '-ascii');
% Saving to Excel file
writematrix(randomMatrix, 'matrixData.xlsx');
% Saving to CSV file
writematrix(randomMatrix, 'matrixData.csv', 'Delimiter', ',');
% Add a variable to an existing file
save('vecotrData.mat', 'randomVector', '-append');

%% Loading
% Deleting pre-created variables from workspace
clear;
% Load variables saved in simple Matlab data
load('dataAll.mat');
% Store all variables saved in MAT file into a struct
dataStruct = load('dataAll.mat');
% Load specific variables saved in MAT file
dataStruct2 = load('dataAll.mat', 'randomMatrix', 'randomVector');
% Loading from TXT file
% Saved with Matlab
randomMatrix = load('matrixData.txt');
% In general, TXT files must be parsed according to the data structure
fileId = fopen('matrixData.txt');
formatSpecfication = '%f';
matrixSize = [10, 10];
parsedMatrix = fscanf(fileId, formatSpecfication, matrixSize);
% Loading from Excel file
matrixFromExcel = readmatrix('matrixData.xlsx');
% Load from CSV file with header
dataTable = readtable('covidData_2021_03_09.csv');

%% Save to other directory
currentFolder = pwd;
parentDirectory = fileparts(currentFolder);
destinationFolder = parentDirectory;
filename = 'anyfile.mat';
fullPath = [destinationFolder, filesep, filename];
save(fullPath, 'randomMatrix');

%% Save and load of JSON files
% JSON is an open standard file format and data interchange format that 
% uses human-readable text to store and transmit data objects consisting
% of attribute–value pairs and arrays. It is commonly used in web 
% programming to transmit data between the backend and frontend.

jsonString = jsonencode(pokemon);
file = fopen('struct.json', 'w');
fprintf(file, '%s', jsonString);
fclose(file);
parsedJson = jsondecode(fileread('struct.json'));