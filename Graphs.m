%% 🌱 EASY TO INTERMEDIATE GRAPH PLOTTING IN MATLAB
clc;
clear;
close all;

%% 1️⃣ Simple Line Plot
x = 0:0.1:10;
y = sin(x);
figure;
plot(x, y);
title('Sine Wave');
xlabel('x');
ylabel('sin(x)');
grid on;

%% 2️⃣ Multiple Lines in One Graph
figure;
x = 0:0.1:10;
plot(x, sin(x), 'r', 'LineWidth', 2);
hold on;
plot(x, cos(x), 'b', 'LineWidth', 2);
legend('sin(x)', 'cos(x)');
title('Multiple Lines');
xlabel('x');
ylabel('y');
grid on;

%% 3️⃣ Scatter Plot
figure;
x = rand(1, 20);
y = rand(1, 20);
scatter(x, y, 'filled');
title('Random Scatter Plot');
xlabel('X');
ylabel('Y');
grid on;

%% 4️⃣ Bar Graph
figure;
data = [5 8 3 6 7];
bar(data);
title('Bar Graph Example');
xlabel('Category');
ylabel('Value');
grid on;

%% 5️⃣ Subplots (Multiple Graphs in One Window)
figure;
x = 0:0.1:10;
subplot(2,1,1);
plot(x, sin(x), 'r', 'LineWidth', 2);
title('Sine Function');
xlabel('x');
ylabel('sin(x)');
grid on;

subplot(2,1,2);
plot(x, cos(x), 'b', 'LineWidth', 2);
title('Cosine Function');
xlabel('x');
ylabel('cos(x)');
grid on;

%% 6️⃣ 3D Surface Plot
figure;
[X, Y] = meshgrid(-5:0.5:5, -5:0.5:5);
Z = sin(sqrt(X.^2 + Y.^2));
surf(X, Y, Z);
title('3D Surface Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
colorbar;
shading interp;

%% 7️⃣ Contour Plot
figure;
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);
Z = X.^2 + Y.^2;
contour(X, Y, Z, 20);
title('Contour Plot');
xlabel('X');
ylabel('Y');
grid on;

%% 8️⃣ Animated Plot
figure;
x = 0:0.1:10;
y = sin(x);
for i = 1:length(x)
    plot(x(1:i), y(1:i), 'b', 'LineWidth', 2);
    axis([0 10 -1.5 1.5]);
    title('Animated Sine Wave');
    xlabel('x');
    ylabel('sin(x)');
    grid on;
    pause(0.05);
end

%% 9️⃣ 3D Line Plot
figure;
t = 0:0.1:10;
x = sin(t);
y = cos(t);
z = t;
plot3(x, y, z, 'm', 'LineWidth', 2);
title('3D Line Plot');
xlabel('X = sin(t)');
ylabel('Y = cos(t)');
zlabel('Z = t');
grid on;

%% 🔟 Histogram Plot
figure;
data = randn(1, 1000); % Random normally distributed data
histogram(data, 30, 'FaceColor', 'g');
title('Histogram of Random Data');
xlabel('Value');
ylabel('Frequency');
grid on;

%% 1️⃣1️⃣ Pie Chart
figure;
values = [30 20 25 15 10];
labels = {'A', 'B', 'C', 'D', 'E'};
pie(values, labels);
title('Pie Chart Example');

%% 1️⃣2️⃣ Stem Plot
figure;
x = 0:0.5:10;
y = sin(x);
stem(x, y, 'filled', 'r');
title('Stem Plot');
xlabel('x');
ylabel('sin(x)');
grid on;

%% 1️⃣3️⃣ Area Plot
figure;
x = 0:0.1:10;
y1 = sin(x) + 1;
y2 = cos(x) + 1;
area(x, [y1' y2']);
title('Area Plot of sin(x) and cos(x)');
xlabel('x');
ylabel('Value');
legend('sin(x)+1', 'cos(x)+1');
grid on;

%% 1️⃣4️⃣ Heatmap
figure;
data = rand(10, 10);
heatmap(data);
title('Heatmap Example');

%% 1️⃣5️⃣ Vector Field (Quiver Plot)
figure;
[x, y] = meshgrid(-2:0.4:2, -2:0.4:2);
u = -y;
v = x;
quiver(x, y, u, v);
title('Vector Field (Quiver Plot)');
xlabel('X');
ylabel('Y');
axis equal;
grid on;

%% 1️⃣6️⃣ Filled Contour Plot
figure;
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);
Z = sin(X).*cos(Y);
contourf(X, Y, Z, 20);
title('Filled Contour Plot');
xlabel('X');
ylabel('Y');
colorbar;
shading interp;

%% 1️⃣7️⃣ Polar Plot
figure;
theta = 0:0.01:2*pi;
rho = 2*sin(3*theta);
polarplot(theta, rho, 'LineWidth', 2);
title('Polar Plot');

%% 1️⃣8️⃣ Surface with Lighting
figure;
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);
Z = peaks(X, Y);
surf(X, Y, Z);
title('3D Surface with Lighting');
xlabel('X'); ylabel('Y'); zlabel('Z');
shading interp;
camlight; lighting phong;

%% 1️⃣9️⃣ Mesh Plot
figure;
[X, Y] = meshgrid(-3:0.1:3, -3:0.1:3);
Z = sin(X).*cos(Y);
mesh(X, Y, Z);
title('3D Mesh Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;

%% 2️⃣0️⃣ Boxplot
figure;
data = randn(50, 4);
boxplot(data, {'Set1', 'Set2', 'Set3', 'Set4'});
title('Boxplot Example');
ylabel('Values');
grid on;

disp('✅ All graph examples completed successfully!');

%% 2️⃣1️⃣ Logarithmic Plot (Semilog-Y)
figure;
x = 0:0.1:10;
y = exp(x/3);
semilogy(x, y, 'LineWidth', 2);
title('Semilog-Y Plot');
xlabel('x');
ylabel('exp(x/3)');
grid on;

%% 2️⃣2️⃣ Log-Log Plot
figure;
x = 1:0.1:10;
y = x.^2;
loglog(x, y, 'LineWidth', 2);
title('Log-Log Plot');
xlabel('x');
ylabel('x^2');
grid on;

%% 2️⃣3️⃣ Error Bar Plot
figure;
x = 1:5;
y = [5 7 6 8 7];
err = [0.5 0.3 0.4 0.2 0.6];
errorbar(x, y, err, 'LineWidth', 2);
title('Error Bar Plot');
xlabel('X');
ylabel('Y');
grid on;

%% 2️⃣4️⃣ Stacked Bar Graph
figure;
data = randi([1 10], 5, 3);
bar(data, 'stacked');
title('Stacked Bar Graph');
xlabel('Category');
ylabel('Value');
grid on;

%% 2️⃣5️⃣ Horizontal Bar Graph
figure;
data = [4 7 1 9 3];
barh(data);
title('Horizontal Bar Graph');
xlabel('Value');
ylabel('Category');
grid on;

%% 2️⃣6️⃣ Filled Area Between Curves
figure;
x = 0:0.1:10;
y1 = sin(x);
y2 = cos(x);
fill([x fliplr(x)], [y1 fliplr(y2)], 'c');
title('Filled Area Between sin(x) and cos(x)');
xlabel('x');
ylabel('Value');
grid on;

%% 2️⃣7️⃣ Waterfall Plot
figure;
[X, Y] = meshgrid(-3:0.2:3);
Z = sin(X).*cos(Y);
waterfall(X, Y, Z);
title('Waterfall Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;

%% 2️⃣8️⃣ Pareto Chart
figure;
data = randi([1 20], 1, 6);
pareto(data);
title('Pareto Chart');

%% 2️⃣9️⃣ Bubble Chart
figure;
x = rand(1,20);
y = rand(1,20);
sizes = rand(1,20) * 500;
bubblechart(x, y, sizes);
title('Bubble Chart');
xlabel('X');
ylabel('Y');
grid on;

%% 3️⃣0️⃣ Animated Moving Point
figure;
x = 0:0.1:2*pi;
y = sin(x);
for i = 1:length(x)
    plot(x, y, 'b'); hold on;
    plot(x(i), y(i), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    hold off;
    title('Moving Point on Sine Curve');
    xlabel('x');
    ylabel('sin(x)');
    grid on;
    pause(0.05);
end

%% 3️⃣1️⃣ Histogram with Probability Normalization
figure;
data = randn(1,1000);
histogram(data, 'Normalization', 'probability');
title('Normalized Histogram');
xlabel('Value');
ylabel('Probability');
grid on;

%% 3️⃣2️⃣ Dual Y-Axis Plot
figure;
x = 0:0.1:10;
y1 = sin(x);
y2 = exp(x/5);
yyaxis left
plot(x, y1, 'LineWidth', 2);
ylabel('sin(x)');
yyaxis right
plot(x, y2, 'LineWidth', 2);
ylabel('exp(x/5)');
title('Dual Y-Axis Plot');
xlabel('x');
grid on;

%% 3️⃣3️⃣ Stair Plot
figure;
x = 0:1:10;
y = randi([1 10],1,11);
stairs(x, y, 'LineWidth', 2);
title('Stair Plot');
xlabel('x');
ylabel('Value');
grid on;

%% 3️⃣4️⃣ Compass Plot
figure;
theta = linspace(0, 2*pi, 10);
u = cos(theta);
v = sin(theta);
compass(u, v);
title('Compass Plot');

%% 3️⃣5️⃣ Ribbon Plot
figure;
[X,Y] = meshgrid(-3:0.2:3);
Z = sin(X).*cos(Y);
ribbon(Z);
title('Ribbon Plot');
grid on;

%% 3️⃣6️⃣ Animated Growing Circle
figure;
theta = linspace(0,2*pi,200);
for r = 0:0.1:5
    x = r*cos(theta);
    y = r*sin(theta);
    plot(x,y,'LineWidth',2);
    axis equal;
    axis([-6 6 -6 6]);
    title('Growing Circle Animation');
    grid on;
    pause(0.05);
end

%% 3️⃣7️⃣ Filled 3D Surface with Edge Removal
figure;
[X,Y] = meshgrid(-2:0.1:2);
Z = X.*exp(-X.^2 - Y.^2);
surf(X,Y,Z,'EdgeColor','none');
title('Smooth Surface Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
colorbar;
grid on;

%% 3️⃣8️⃣ Polar Scatter Plot
figure;
theta = 2*pi*rand(1,100);
rho = rand(1,100);
polarscatter(theta,rho,'filled');
title('Polar Scatter Plot');

%% 3️⃣9️⃣ Time Series Plot with Datetime
figure;
t = datetime(2024,1,1) + days(0:9);
y = rand(1,10);
plot(t,y,'LineWidth',2);
title('Time Series Plot');
xlabel('Date');
ylabel('Value');
grid on;

%% 4️⃣0️⃣ Custom Colormap Surface Plot
figure;
[X,Y] = meshgrid(-3:0.1:3);
Z = peaks(X,Y);
surf(X,Y,Z);
colormap(jet);
colorbar;
title('Surface Plot with Custom Colormap');
xlabel('X');
ylabel('Y');
zlabel('Z');
shading interp;
grid on;


%% 4️⃣1️⃣ 3D Scatter Plot
figure;
x = rand(1,100);
y = rand(1,100);
z = rand(1,100);
scatter3(x,y,z,'filled');
title('3D Scatter Plot');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on;

%% 4️⃣2️⃣ Step Response Style Plot
figure;
t = 0:0.1:10;
y = ones(size(t));
y(t<5) = 0;
plot(t,y,'LineWidth',2);
title('Step Function Plot');
xlabel('Time');
ylabel('Amplitude');
grid on;

%% 4️⃣3️⃣ Frequency Spectrum (FFT)
figure;
fs = 1000;
t = 0:1/fs:1;
signal = sin(2*pi*50*t) + sin(2*pi*120*t);
Y = abs(fft(signal));
f = linspace(0,fs,length(Y));
plot(f,Y);
title('Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

%% 4️⃣4️⃣ Lissajous Curve
figure;
t = linspace(0,2*pi,1000);
x = sin(3*t);
y = sin(4*t);
plot(x,y,'LineWidth',2);
title('Lissajous Curve');
xlabel('X'); ylabel('Y');
axis equal;
grid on;

%% 4️⃣5️⃣ Filled Polygon Plot
figure;
x = [1 3 5 4 2];
y = [2 5 3 1 1];
fill(x,y,'y');
title('Filled Polygon');
xlabel('X'); ylabel('Y');
grid on;

%% 4️⃣6️⃣ Moving Sine Wave Animation
figure;
x = 0:0.1:10;
for k = 1:50
    y = sin(x - k*0.2);
    plot(x,y,'LineWidth',2);
    axis([0 10 -1.5 1.5]);
    title('Moving Sine Wave');
    grid on;
    pause(0.05);
end

%% 4️⃣7️⃣ Gaussian Curve Plot
figure;
x = -5:0.1:5;
y = exp(-x.^2);
plot(x,y,'LineWidth',2);
title('Gaussian Curve');
xlabel('x'); ylabel('e^{-x^2}');
grid on;

%% 4️⃣8️⃣ Cumulative Sum Plot
figure;
data = rand(1,50);
cs = cumsum(data);
plot(cs,'LineWidth',2);
title('Cumulative Sum Plot');
xlabel('Index');
ylabel('Cumulative Value');
grid on;

%% 4️⃣9️⃣ Spiral Plot
figure;
theta = linspace(0,10*pi,1000);
r = theta;
x = r .* cos(theta);
y = r .* sin(theta);
plot(x,y,'LineWidth',2);
title('Spiral Plot');
axis equal;
grid on;

%% 5️⃣0️⃣ Animated Bouncing Ball
figure;
x = 0:0.1:10;
y = abs(sin(x));
for i = 1:length(x)
    plot(x,y,'b'); hold on;
    plot(x(i), y(i), 'ro', 'MarkerFaceColor','r');
    hold off;
    axis([0 10 0 1.5]);
    title('Bouncing Ball Animation');
    grid on;
    pause(0.05);
end

disp('🎯 Completed 50 MATLAB Graph Examples!');
