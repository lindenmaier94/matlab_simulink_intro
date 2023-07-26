% This script is intended to introduce the usage and the pupose of fprintf
% function in Matlab.

% Fprintf is a traditional function of C programming to write data into 
% TXT file. However, it is also useful to display numeric values in a
% specific format. If you do not specify the format of the timestamp, 
% the printed timestamp will be jumping in the video.
%% Data definition
integer = 5;
floatingPoint = pi;

%% Display numbers with specific format
% Special characters:
% \r : carriage return
% \n : new line
% \b : backspace

fprintf('%d\n', integer); % decimal integer
fprintf('%10d\n', integer); % decimal integer with 10 digits
fprintf('%010d\n', integer); % decimal integer with 10 digits padded with zeros
fprintf('%+010d\n', integer); % with sign

fprintf('%f\n', floatingPoint); % floating point
fprintf('%.10f\n', floatingPoint); % 10 digits for floating point representation
fprintf('%+20.10f\n', floatingPoint); % 10 digits for floating point representation with sign

fprintf('%e\n', floatingPoint); % normal form

fprintf('%g\n', integer);
fprintf('%g\n', floatingPoint);
fprintf('%g\n', floatingPoint * 1e-10);