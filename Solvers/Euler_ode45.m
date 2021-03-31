clc; clear; close all

h = 0.1;
x = 0: h: 3;
n = length(x);
y = zeros(1, n);
ic = 2;
y(1) = ic;
%% Forward Euler
for i = 2:n
    y(i) = y(i-1) + fun(x(i-1), y(i-1))*h;
end
%% ode 45
[x, y_] = ode45(@fun, x, ic);

fprintf('\nThe value of y(3) from Forward Euler method : %d\nThe value of y(3) from ode45 : %d\n',y(end), y_(end));

function dy = fun(x, y)

dy = 2*x -y^2*x;

end