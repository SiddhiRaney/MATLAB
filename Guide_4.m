%% MATLAB Advanced Practice Guide (Extended)
% Covers: Advanced Plotting, File Handling, Vectorization,
% Numerical Solving, GUI Preview, Matrix Operations, 3D Plotting,
% and Symbolic Math

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

%% 6. Matrix Operations and Eigenvalue Computation
disp('--- Matrix Operations ---');
A = [2 4 1; 0 1 -1; 3 2 5];
B = [1 0 2; 2 3 1; 4 -1 0];

C_add = A + B;
C_mul = A * B;
C_inv = inv(A);

disp('Matrix A:');
disp(A);
disp('Matrix B:');
disp(B);
disp('A + B:');
disp(C_add);
disp('A * B:');
disp(C_mul);
disp('Inverse of A:');
disp(C_inv);

% Eigenvalues and Eigenvectors
[eVec, eVal] = eig(A);
disp('Eigenvalues of A:');
disp(diag(eVal));
disp('Eigenvectors of A:');
disp(eVec);

%% 7. 3D Plotting and Surface Visualization
[xGrid, yGrid] = meshgrid(-3:0.1:3, -3:0.1:3);
z = sin(sqrt(xGrid.^2 + yGrid.^2));

figure;
surf(xGrid, yGrid, z);
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('3D Surface: z = sin(sqrt(x^2 + y^2))');
shading interp; % smooth surface
colorbar;
grid on;

figure;
mesh(xGrid, yGrid, z);
title('3D Mesh Plot');
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
grid on;

%% 8. Symbolic Math Operations
syms xSym;
fSym = sin(xSym)^2 * exp(xSym);

% Differentiation and Integration
f_deriv = diff(fSym);
f_int = int(fSym);

% Limits and Taylor Expansion
f_limit = limit(fSym/xSym, xSym, 0);
f_taylor = taylor(fSym, xSym, 'Order', 6);

disp('--- Symbolic Math ---');
disp('f(x) = sin^2(x) * exp(x)');
disp('Derivative of f(x):');
disp(f_deriv);
disp('Integral of f(x):');
disp(f_int);
disp(['Limit f(x)/x as x->0: ', char(f_limit)]);
disp('Taylor Series Expansion (Order 6):');
disp(f_taylor);

fplot(fSym, [-2, 2], 'LineWidth', 2);
title('Symbolic Function Plot: sin^2(x) * exp(x)');
xlabel('x'); ylabel('f(x)');
grid on;

%% 9. Numerical Integration Example
disp('--- Numerical Integration Example ---');
fun = @(x) exp(-x.^2);
integral_val = integral(fun, 0, inf);
disp(['Integral of exp(-x^2) from 0 to infinity: ', num2str(integral_val)]);

%% 10. Saving and Loading Workspace Data
save('workspace_data.mat');
disp('Workspace variables saved to workspace_data.mat');
clearvars -except integral_val
load('workspace_data.mat');
disp('Workspace reloaded from workspace_data.mat');

t = 0:0.1:5;
v0 = 20;
g = 9.8;
h = v0*t - 0.5*g*t.^2;
plot(t, h); xlabel('Time (s)'); ylabel('Height (m)');
title('Projectile Motion under Gravity');

%% 11. Polynomial Fitting and Curve Approximation
disp('--- Polynomial Curve Fitting ---');

xData = 0:1:10;
yData = 3*xData.^2 + 2*xData + 5 + randn(size(xData))*10; % noisy quadratic data

p = polyfit(xData, yData, 2);   % quadratic fit
yFit = polyval(p, xData);

figure;
plot(xData, yData, 'bo'); hold on;
plot(xData, yFit, 'r-', 'LineWidth', 2);
legend('Noisy Data', 'Fitted Curve');
title('Polynomial Curve Fitting');
grid on;


%% 12. Fast Fourier Transform (FFT)
disp('--- FFT Analysis ---');

Fs = 1000;                    % Sampling frequency
tFFT = 0:1/Fs:1-1/Fs;
signal = sin(2*pi*50*tFFT) + 0.5*sin(2*pi*120*tFFT);

Y = fft(signal);
P2 = abs(Y/length(signal));
P1 = P2(1:length(signal)/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(length(signal)/2))/length(signal);

figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
grid on;


%% 13. Optimization Using fminsearch
disp('--- Function Optimization ---');

objFun = @(x) (x-3).^2 + 4;
x_min = fminsearch(objFun, 0);

disp(['Minimum occurs at x = ', num2str(x_min)]);
disp(['Minimum value = ', num2str(objFun(x_min))]);


%% 14. Solving Nonlinear Equation using fzero
disp('--- Solving Nonlinear Equation ---');

nonlinearFun = @(x) x^3 - 5*x + 1;
root = fzero(nonlinearFun, 0);

disp(['Root of equation x^3 - 5x + 1 = 0 is: ', num2str(root)]);


%% 15. Monte Carlo Simulation (Estimating Pi)
disp('--- Monte Carlo Simulation for Pi ---');

numPoints = 10000;
xRand = rand(numPoints,1);
yRand = rand(numPoints,1);

insideCircle = (xRand.^2 + yRand.^2) <= 1;
pi_estimate = 4 * sum(insideCircle) / numPoints;

disp(['Estimated value of Pi: ', num2str(pi_estimate)]);

figure;
scatter(xRand(insideCircle), yRand(insideCircle), 'g'); hold on;
scatter(xRand(~insideCircle), yRand(~insideCircle), 'r');
title('Monte Carlo Estimation of Pi');
axis equal;
grid on;

%% End of Extended Advanced Guide
disp('--- End of MATLAB Advanced Practice Guide (Extended Version) ---');

