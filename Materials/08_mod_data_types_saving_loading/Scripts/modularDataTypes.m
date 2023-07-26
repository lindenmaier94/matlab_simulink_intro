% Modular data types enable storing data with different types into 
% one variable. There are two common modular data types:
% cells,
% structs.

%% Cells
% Cells are arrays (like vectors and matrices), but the elements can have 
% different and arbitrary types, not only scalars.
% Let's create a cell array consisting of 3 elements a 
% scalar, a character vector, and a vector:

cellVariable = {1, 'apple', [1, 2, 3]};

% Array indexing provides the result within a cell 
% (one element of the cell array)
cellElement1 = cellVariable(1);

% You can select multiple elements of the cell array:
cellElements12 = cellArray(1:2);

% Cell indexing that provides the content of the 
% corresponding cell element: 
cellElement1Content = cellVariable{1};

% Please, note that only the content of one element can be selected by 
% cell indexing. Loops must be applied to access the data of multiple 
% cell array elements.
%% Structs
% A data type that enables you to store data with different properties 
% into one  variable. The properties of the data corresponds to the fields
% of the struct. It is useful to describe objects with different properties
% such as cars. Structs are close to classes of object-oriented programming. 

% Simple struct
% Let's create a struct describing the properties of a car with different 
% data types:
car.manufacturer = 'Mercedes-Benz';
car.model = 'S-Class';
car.year = 2021;
car.price = 35e6;

% Accessing data
car.manufacturer
car.year

% Storing the fields (field names) of the struct into a cell array:
fNames = fieldnames(car);

% Dynamic acces of struct fields enables acessing the data of a specific 
% field defined by its name stored in a separate variable. 
% Let's get the data stored in each field of the struct:

for i = 1 : numel(fNames)
    currentField = fNames{i}
    dataOfCurrentField = car.(currentField)
end

% Struct arrays

car2.manufacturer = 'BMW';
car2.model = '320';
car2.year = 2019;
car2.price = 30e6;

carsArray = [car; car2];

numOfCars = numel(carsArray);
for i = 1 : numOfCars
    currentCar = carsArray(i)
end
