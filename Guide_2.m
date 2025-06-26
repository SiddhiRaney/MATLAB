% MATLAB Beginner Guide
% Author: Your Name
% This script covers basic MATLAB operations

clc;
clear;
close all;

%% 1. Matrix Operations
disp('--- Matrix Operations ---');
A = [1 2; 3 4];
B = [5 6; 7 8];

sumAB = A + B;
disp('Matrix Sum:');
disp(sumAB);

productAB = A * B;
disp('Matrix Product:');
disp(productAB);

transposeA = A';
disp('Transpose of Matrix A:');
disp(transposeA);

inverseA = inv(A);
disp('Inverse of Matrix A:');
disp(inverseA);

%% 2. Plotting a Graph
disp('--- Plotting a Graph ---');
x = 0:0.1:10;
y = sin(x);

figure; % Opens a new figure window
plot(x, y, 'r', 'LineWidth', 2);
xlabel('x-axis');
ylabel('sin(x)');
title('Sine Wave Plot');
grid on;

%% 3. Solving Equations
disp('--- Solving Equations ---');
syms x;
eqn = x^2 - 5*x + 6 == 0;
solutions = solve(eqn, x);
disp('Solutions of the equation x^2 - 5x + 6 = 0:');
disp(solutions);

%% 4. For Loop Example (Summation)
disp('--- For Loop Summation ---');
sumResult = 0;
for i = 1:10
    sumResult = sumResult + i;
end
disp(['Sum of numbers from 1 to 10 is: ', num2str(sumResult)]);

%% 5. Writing and Calling a Function (Factorial Example)
disp('--- Factorial Function Example ---');
n = 5; % You can change this number
factorialResult = factorial_calc(n);
disp(['Factorial of ', num2str(n), ' is: ', num2str(factorialResult)]);

%% Function Definition
function f = factorial_calc(n)
    f = 1;
    for i = 1:n
        f = f * i;
    end
end
