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
