%% MATLAB Advanced Practice Guide
% Covers: Advanced Plotting, File Handling, Vectorization, Numerical Solving, and GUI Preview

clc;
clear;
close all;

%% 1. Advanced Plotting: Multiple Plots with Legends
x = 0:0.1:10;
y1 = sin(x);
y2 = cos(x);
y3 = exp(-0.1 * x) .* sin(x);

figure;
plot(x, y1, 'r', 'LineWidth', 1.5); hold on;
plot(x, y2, 'b--', 'LineWidth', 1.5);
plot(x, y3, 'g:', 'LineWidth', 2);
xlabel('X-axis');
ylabel('Y-axis');
title('Multiple Function Plot');
legend('sin(x)', 'cos(x)', 'Damped sin(x)');
grid on;

%% 2. File Handling: Writing and Reading Data from a Text File
data = [x' y1' y2' y3'];
fileID = fopen('function_data.txt', 'w');
fprintf(fileID, 'X sin(x) cos(x) Damped_sin(x)\n');
fprintf(fileID, '%6.2f %10.4f %10.4f %10.4f\n', data');
fclose(fileID);

disp('Data written to function_data.txt');

% Reading the file
disp('Reading the file:');
fileID = fopen('function_data.txt', 'r');
textData = fread(fileID, '*char')';
fclose(fileID);
disp(textData);

%% 3. Vectorized Summation (Avoiding Loops)
v = 1:10000;
sum_v = sum(v); % Vectorized sum, no loop
disp(['Sum of 1 to 10000: ', num2str(sum_v)]);

%% 4. Solving a Differential Equation (dy/dt = -2y)
% Using ode45 solver
disp('Solving dy/dt = -2y using ode45');
odeFun = @(t, y) -2*y;
[tSol, ySol] = ode45(odeFun, [0 5], 1);

figure;
plot(tSol, ySol, 'm', 'LineWidth', 2);
xlabel('Time t');
ylabel('Solution y');
title('Solution of dy/dt = -2y');
grid on;

%% 5. Simple GUI Preview using App Designer (Manual Task)
disp('For GUI: Open MATLAB App Designer to build buttons, sliders, and interactive plots.');

%% 6. Matrix Operations and Eigenvalues
A = [4 2; 1 3];
disp('Matrix A:');
disp(A);

detA = det(A);
invA = inv(A);
[eVec, eVal] = eig(A);

disp(['Determinant of A: ', num2str(detA)]);
disp('Inverse of A:');
disp(invA);
disp('Eigenvalues of A:');
disp(diag(eVal));

%% 7. Symbolic Math Toolbox Usage
syms x_sym
f = x_sym^3 - 6*x_sym^2 + 11*x_sym - 6;

df = diff(f);              % First derivative
intf = int(f);             % Indefinite integral
roots_f = solve(f == 0);   % Solving equation

disp('Symbolic Function:');
disp(f);
disp('Derivative:');
disp(df);
disp('Integral:');
disp(intf);
disp('Roots:');
disp(roots_f);

%% 8. 3D Plotting
[X, Y] = meshgrid(-5:0.5:5);
Z = sin(sqrt(X.^2 + Y.^2));

figure;
surf(X, Y, Z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Surface Plot');
shading interp;
colorbar;

%% 9. Data Visualization with Subplots
t = 0:0.1:2*pi;

figure;
subplot(2,2,1);
plot(t, sin(t)); title('sin(t)');

subplot(2,2,2);
plot(t, cos(t)); title('cos(t)');

subplot(2,2,3);
plot(t, tan(t)); title('tan(t)');

subplot(2,2,4);
plot(t, sin(t).*cos(t)); title('sin(t)cos(t)');

%% 10. Performance Measurement using tic-toc
disp('Performance Comparison');

tic;
sum_loop = 0;
for i = 1:1000000
    sum_loop = sum_loop + i;
end
loop_time = toc;

tic;
sum_vec = sum(1:1000000);
vec_time = toc;

disp(['Loop Time: ', num2str(loop_time)]);
disp(['Vectorized Time: ', num2str(vec_time)]);

%% End of Advanced Guide
disp('--- End of MATLAB Advanced Practice Guide ---');
