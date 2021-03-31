clc; clear; close all

dt = 0.4;
tMax = 4;
t = 0:dt:tMax;
n = length(t);

y = zeros(1,n);
y(1) = 0;

for i = 2:n
    k1 = fun(t(i-1), y(i-1));
    k2 = fun(t(i-1) + dt, y(i-1) + dt*k1);
    y(i) = y(i-1) + dt*(k1+k2)/2;
end

plot(t, y)
xlabel('x'); ylabel('y')

function dy = fun(x, y)
dy(1) = x + 3*cos(x*y);
end