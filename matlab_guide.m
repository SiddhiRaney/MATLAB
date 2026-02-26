%% MATLAB Beginner Guide
% This script introduces basic MATLAB syntax, operators, and control structures.

%% SECTION 1: VARIABLE CREATION
a = 5;       % Assigns value 5 to variable a
b = 10;      % Assigns value 10 to variable b

%% SECTION 2: ARITHMETIC OPERATORS
add = a + b;           % Addition
sub = a - b;           % Subtraction
mul = a * b;           % Multiplication
div = a / b;           % Division
power = a ^ 2;         % Matrix power
ele_power = a .^ 2;    % Element-wise power
remainder = mod(a, b); % Modulus

disp('Arithmetic Operations:');
disp(['Addition: ', num2str(add)]);
disp(['Subtraction: ', num2str(sub)]);
disp(['Multiplication: ', num2str(mul)]);
disp(['Division: ', num2str(div)]);
disp(['Matrix Power: ', num2str(power)]);
disp(['Element-wise Power: ', num2str(ele_power)]);
disp(['Remainder: ', num2str(remainder)]);

%% SECTION 3: RELATIONAL OPERATORS
disp('Relational Operations:');
disp(['Equal to: ', num2str(a == b)]);
disp(['Not equal to: ', num2str(a ~= b)]);
disp(['Greater than: ', num2str(a > b)]);
disp(['Less than: ', num2str(a < b)]);
disp(['Greater or equal: ', num2str(a >= b)]);
disp(['Less or equal: ', num2str(a <= b)]);

%% SECTION 4: LOGICAL OPERATORS
disp('Logical Operations:');
disp(['AND: ', num2str((a > 0) & (b > 0))]);
disp(['OR: ', num2str((a > 0) | (b > 0))]);
disp(['NOT: ', num2str(~(a > 0))]);

%% SECTION 5: IF-ELSE STATEMENT
n = 7;
if mod(n, 2) == 0
    disp([num2str(n), ' is Even']);
else
    disp([num2str(n), ' is Odd']);
end

%% SECTION 6: FOR LOOP
disp('For Loop Example:');
for i = 1:5
    disp(['Count: ', num2str(i)]);
end

%% SECTION 7: WHILE LOOP
disp('While Loop Example:');
i = 1;
while i <= 5
    disp(['Count: ', num2str(i)]);
    i = i + 1;
end

%% SECTION 8: FACTORIAL PROGRAM
n = 5;
fact = 1;
for i = 1:n
    fact = fact * i;
end
disp(['Factorial of ', num2str(n), ' is ', num2str(fact)]);

%% SECTION 9: MULTIPLICATION TABLE
n = 4;
disp(['Multiplication Table of ', num2str(n)]);
for i = 1:10
    disp([num2str(n), ' x ', num2str(i), ' = ', num2str(n * i)]);
end

%% SECTION 10: SINE WAVE PLOT
x = 0:0.01:2*pi;
y = sin(x);
figure;
plot(x, y);
xlabel('x-axis');
ylabel('y-axis');
title('Sine Wave');
grid on;

%% SECTION 11: MATRIX CREATION AND OPERATIONS
A = [1 2; 3 4];     % 2x2 matrix
B = [5 6; 7 8];

mat_add = A + B;    % Matrix addition
mat_mul = A * B;    % Matrix multiplication
transpose_A = A';   % Transpose

disp('Matrix Operations:');
disp('Matrix Addition:');
disp(mat_add);
disp('Matrix Multiplication:');
disp(mat_mul);
disp('Transpose of A:');
disp(transpose_A);

%% SECTION 12: USER INPUT
num = input('Enter a number: ');
disp(['You entered: ', num2str(num)]);

%% SECTION 13: VECTOR OPERATIONS
v = 1:5;                 % Row vector
sq = v.^2;               % Element-wise square
sum_v = sum(v);          % Sum of elements
mean_v = mean(v);        % Mean value

disp('Vector Operations:');
disp(['Vector: ', num2str(v)]);
disp(['Squared: ', num2str(sq)]);
disp(['Sum: ', num2str(sum_v)]);
disp(['Mean: ', num2str(mean_v)]);

%% SECTION 14: SWITCH CASE
day = 3;
switch day
    case 1
        disp('Monday');
    case 2
        disp('Tuesday');
    case 3
        disp('Wednesday');
    otherwise
        disp('Invalid Day');
end

%% SECTION 15: BAR GRAPH
data = [5 10 15 20];
figure;
bar(data);
xlabel('Index');
ylabel('Value');
title('Bar Graph Example');
grid on;

%% End of Guide
disp('--- End of MATLAB Beginner Guide ---');
