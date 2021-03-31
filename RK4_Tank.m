clc; clear; close all

dt = 100; % time step in min
tSpan = 0:dt:30000; % time span to be evaluated
l_ic = 5; % initial condition of half tank
n = length(tSpan);
length = zeros(1,n);
length(1) = l_ic;

for i = 2:n
    % RK4 Method
    k1 = dt*fun(length(i-1));
    k2 = dt*fun(length(i-1)+k1/2);
    k3 = dt*fun(length(i-1)+k2/2);
    k4 = dt*fun(length(i-1)+k3);
    
    length(i) = length(i-1)+1/6*k1+1/3*k2+1/3*k3+1/6*k4;
    if length(i) <= 0 && length(i-1) > 0 % to find when the curve crosses the zero line
        empty_time = (i-1)*dt; 
    end
end

fprintf('\n Time taken to empty the half tank (l = 5m) is approximately %d min\n',empty_time);

function dl = fun(l) % dl/dt
    
    r = 0.02;
    g = 9.81;
    R = 5;
    
    dl = -(r^2 *sqrt(2*g*l))/(2*l*R - l^2);
    
end