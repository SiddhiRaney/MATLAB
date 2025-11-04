% Simple Calculator in MATLAB

clc;    % Clear the command window
clear;  % Clear workspace variables

% Display menu
disp('--- Simple MATLAB Calculator ---');
disp('1. Addition');
disp('2. Subtraction');
disp('3. Multiplication');
disp('4. Division');

% Take user input
choice = input('Enter your choice (1-4): ');

% Take two numbers as input
a = input('Enter first number: ');
b = input('Enter second number: ');

% Perform operation based on choice
switch choice
    case 1
        result = a + b;
        fprintf('Result: %.2f + %.2f = %.2f\n', a, b, result);
    case 2
        result = a - b;
        fprintf('Result: %.2f - %.2f = %.2f\n', a, b, result);
    case 3
        result = a * b;
        fprintf('Result: %.2f * %.2f = %.2f\n', a, b, result);
    case 4
        if b ~= 0
            result = a / b;
            fprintf('Result: %.2f / %.2f = %.2f\n', a, b, result);
        else
            disp('Error: Division by zero not allowed.');
        end
    otherwise
        disp('Invalid choice! Please run the program again.');
end
