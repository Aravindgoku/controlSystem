clc; clear; close all

dt = 0.01; % step size
tMax = 20;
t = 0:dt:tMax;
n = length(t);

y = zeros(4,n); % First two rows euler and next two rows heuns
y(1) = [2 0 2 0]'; % initial conditions

for i = 2:n
    y([1 2]',i) = y([1 2]',i-1) + dt * fun(y([1 2]',i-1));

    k1 = fun(y([3 4]',i-1));
    y1 = y([3 4]',i-1) + k1*dt;
    k2 = fun(y1);
    y([3 4]',i) = y([3 4]',i-1) + dt*(k1+k2)/2;
end



function dy = fun(x)
mu = 1; %Enter the correct value
dy(1) = x(2);
dy(2) = mu*(1-x(1)^2)*x(2) - x(1);
end