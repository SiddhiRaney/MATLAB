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

%% 11. Polynomial Curve Fitting
x_data = [1 2 3 4 5];
y_data = [2.2 2.8 3.6 4.5 5.1];

p = polyfit(x_data, y_data, 2);   % quadratic fit
y_fit = polyval(p, x_data);

figure;
plot(x_data, y_data, 'ro', 'MarkerSize',8); hold on;
plot(x_data, y_fit, 'b-', 'LineWidth',2);
title('Polynomial Curve Fitting');
legend('Original Data','Fitted Curve');
grid on;

%% 12. Random Number Generation and Histogram
rand_data = randn(1,1000);

figure;
histogram(rand_data,30);
title('Histogram of Random Data');
xlabel('Value');
ylabel('Frequency');

%% 13. Image Processing Example
img = imread('peppers.png');
gray_img = rgb2gray(img);

figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(gray_img); title('Grayscale Image');

%% 14. Numerical Integration
f = @(x) x.^2 .* exp(-x);
result = integral(f,0,5);

disp(['Numerical integration result: ', num2str(result)]);

%% 15. Root Finding using fzero
func = @(x) x^3 - x - 2;
root = fzero(func,1);

disp(['Root of equation: ', num2str(root)]);

%% 16. Interpolation
x_points = 0:5;
y_points = [0 1 4 9 16 25];

xq = 0:0.1:5;
yq = interp1(x_points,y_points,xq,'spline');

figure;
plot(x_points,y_points,'ro',xq,yq,'b-');
title('Interpolation Example');
legend('Data Points','Interpolated Curve');
grid on;

%% 17. Logical Indexing
A = randi([1 20],5,5);
disp('Matrix A:');
disp(A);

filtered = A(A > 10);
disp('Elements greater than 10:');
disp(filtered);

%% 18. Sparse Matrices
S = sparse([1 3 5],[2 4 1],[10 20 30],5,5);

disp('Sparse Matrix:');
disp(S);

%% 19. Parallel Computing Example
parfor i = 1:5
    disp(['Parallel iteration ', num2str(i)]);
end

%% 20. Exporting a Figure
figure;
plot(sin(0:0.1:10));
title('Export Example');

saveas(gcf,'sine_plot.png');

disp('Figure saved as sine_plot.png');

%% 21. Fast Fourier Transform (FFT) for Signal Analysis
fs = 1000;                % Sampling frequency
t = 0:1/fs:1;             % Time vector
signal = sin(2*pi*50*t) + sin(2*pi*120*t);  % Mixed signal

Y = fft(signal);
n = length(signal);
f = (0:n-1)*(fs/n);

figure;
plot(f, abs(Y));
title('FFT Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 200]);

%% 22. Monte Carlo Simulation (Estimating Pi)
N = 100000;
x_rand = rand(N,1);
y_rand = rand(N,1);

inside = (x_rand.^2 + y_rand.^2) <= 1;
pi_est = 4 * sum(inside) / N;

disp(['Estimated value of pi: ', num2str(pi_est)]);

%% 23. Animation Example
t = 0:0.1:10;

figure;
for i = 1:length(t)
    plot(sin(t(1:i)));
    axis([0 length(t) -1 1]);
    title('Animating sin wave');
    drawnow;
end

%% 24. Solving Linear System
A = [3 -1 2; 2 4 0; -1 2 5];
b = [10; 12; 7];

x_sol = A\b;

disp('Solution of linear system Ax=b:');
disp(x_sol);

%% 25. Data Table Example
Names = {'Alice';'Bob';'Charlie'};
Scores = [85;90;78];
T = table(Names,Scores);

disp('Student Table:');
disp(T);

%% 26. Data Smoothing
t = 0:0.1:10;
data = sin(t) + 0.3*randn(size(t));

smooth_data = smoothdata(data,'movmean',5);

figure;
plot(t,data,'r'); hold on;
plot(t,smooth_data,'b','LineWidth',2);
legend('Noisy Data','Smoothed Data');
title('Data Smoothing Example');

%% 27. Contour Plot
[X,Y] = meshgrid(-3:0.1:3);
Z = X.^2 + Y.^2;

figure;
contour(X,Y,Z,20);
title('Contour Plot');
xlabel('X');
ylabel('Y');

%% 28. Bar Graph Visualization
categories = {'A','B','C','D'};
values = [10 25 18 30];

figure;
bar(values);
set(gca,'XTickLabel',categories);
title('Bar Graph Example');
ylabel('Values');

%% 29. Heatmap Visualization
data_matrix = rand(5,5);

figure;
heatmap(data_matrix);
title('Heatmap Example');

%% 30. Saving Workspace Data
save('workspace_data.mat');

disp('Workspace variables saved to workspace_data.mat');

%% 31. Handling Large Data with Tall Arrays
% Used when data is too large to fit in memory
data_folder = 'large_data_sim'; % Placeholder for a folder of CSVs
% t_data = tall(datastore('*.csv')); 
% summary_data = gather(mean(t_data)); 
disp('Tall Arrays: Use "tall" and "gather" for datasets exceeding RAM.');

%% 32. Global Optimization using Genetic Algorithm
% Finding the minimum of the Rosenbrock function
fitnessFunction = @(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
[x_opt, fval] = ga(fitnessFunction, 2); 
disp(['GA Optimal Solution: ', num2str(x_opt)]);

%% 33. Design of Experiments (DOE) - Full Factorial
% Create a 3-factor, 2-level design
design = fullfact([2 2 2]);
disp('Full Factorial Design Matrix (3 Factors, 2 Levels):');
disp(design);

%% 34. Signal Filtering (Butterworth Filter)
fs = 1000; t = 0:1/fs:1;
noisy_sig = sin(2*pi*50*t) + 0.5*randn(size(t));
[b, a] = butter(6, 0.1); % Low-pass filter
clean_sig = filter(b, a, noisy_sig);
figure; plot(t, noisy_sig, 'Color', [0.7 0.7 0.7]); hold on;
plot(t, clean_sig, 'b', 'LineWidth', 2);
title('Butterworth Low-pass Filter');

%% 35. Object-Oriented Programming (Class Definition)
% Note: In MATLAB, this usually goes in a separate .m file
% classdef SimpleCircle
%    properties; Radius; end
%    methods; function a = getArea(obj); a = pi * obj.Radius^2; end; end
% end
disp('OOP: Defined classes using "classdef" for scalable applications.');

%% 36. Working with Datetimes and Durations
t1 = datetime('now');
t2 = t1 + hours(5) + minutes(30);
diff_time = t2 - t1;
disp(['Elapsed Time: ', char(diff_time)]);

%% 37. Supervised Learning: Simple Linear Regression
x = (1:10)'; y = 2*x + randn(10,1);
mdl = fitlm(x, y); % Fit linear model
disp('Linear Regression Model Summary:');
disp(mdl.Coefficients);

%% 38. Map Containers (Key-Value Pairs)
mapObj = containers.Map({'Status200', 'Status404'}, {'OK', 'Not Found'});
disp(['Key Search: ', mapObj('Status404')]);

%% 39. Creating a Custom Toolbox/Function Documentation
% Use help text (comments at the start) to make functions searchable
% help your_function_name
disp('Documentation: Use "%%" and "%" to create searchable help headers.');

%% 40. Deployment and Versioning
% Using 'projects' to manage dependencies
% ver; % Displays version info for all installed toolboxes
disp('Deployment: Use "mcc" (MATLAB Compiler) to create standalone executables.');

%% Final Wrap-up
disp('--- End of Extended MATLAB Advanced Practice Guide (1-40) ---');


%% End of Advanced Guide
disp('--- End of MATLAB Advanced Practice Guide ---');
