clc; clear; close all

dt = 1/60; % time step - 1 sec
tSpan = 0:dt:60; % time span to be evaluated
x_ic = [0; 0]; % initial condition - no salt
n = length(tSpan);
Vol_2 = 100; % Tank2 Volume

x_rk4 = zeros(2,n);
x_rk4(:,1) = x_ic;
x_euler = zeros(2,n);
x_euler(:,1) = x_ic;

x2_actual = 15*(exp(-tSpan/10) - 3*exp(-tSpan/30) + 2);
t_actual = fsolve(@(t) 15*(exp(-t/10) - 3*exp(-t/30) + 2)/Vol_2 - 0.15, 10); % Actual time for tank2 salt concentration to reach 0.15

salt_conc_tank2 = feval(@(t) 15*(exp(-t/10) - 3*exp(-t/30) + 2)/Vol_2,tSpan);

for i = 2:n
    if salt_conc_tank2(i-1) <0.15 && salt_conc_tank2(i) >=0.15
        fprintf('\n Actual time to reach salt concentration of 0.15kg/Gal in Tank 2 is %d min\n',tSpan(i-1));
    end
end

for i = 2:n
    
    % RK4 Method
    k1 = dt*fun((i-1)*dt, x_rk4(:,i-1));
    k2 = dt*fun((i-1)*dt + dt/2, x_rk4(:,i-1)+k1/2);
    k3 = dt*fun((i-1)*dt + dt/2, x_rk4(:,i-1)+k2/2);
    k4 = dt*fun((i-1)*dt + dt, x_rk4(:,i-1)+k3);
    
    x_rk4(:,i) = x_rk4(:,i-1)+1/6*k1+1/3*k2+1/3*k3+1/6*k4;
    
    if x_rk4(2,i-1)/Vol_2 <0.15 && x_rk4(2,i)/Vol_2 >=0.15 % To find the predicted time
        fprintf('\n Predicted time by RK4 method to reach salt concentration of 0.15kg/Gal in Tank 2 is %d min\n',(i-1)*dt);
    end
    
    % Euler Method
    x_euler(:,i) = x_euler(:,i-1) + dt*fun((i-1)*dt, x_euler(:,i-1));
    if x_euler(2,i-1)/Vol_2 <0.15 && x_euler(2,i)/Vol_2 >=0.15 % To find the predicted time
        fprintf('\n Predicted time by Euler method to reach salt concentration of 0.15kg/Gal in Tank 2 is %d min\n',(i-1)*dt);
    end
end

[t, x_ode45] = ode45(@fun, tSpan, x_ic ); % ODE45 Scheme
for j = 2 :length(t) % To find the predicted time
    if x_ode45(j-1,2)/Vol_2 <0.15 && x_ode45(j,2)/Vol_2 >=0.15
        fprintf('\n Predicted time by ODE45 to reach salt concentration of 0.15kg/Gal in Tank 2 is %d min\n',t(j));
        break;
    end  
end

fprintf('\n Actual time to reach salt concentration of 0.15kg/Gal in Tank 2 is %d min\n',t_actual);

plot(tSpan, x_rk4(2,:)/Vol_2, 'LineWidth',2)
hold on
plot(tSpan, x_euler(2,:)/Vol_2, 'LineWidth',2)
plot(t, x_ode45(:,2)/Vol_2, 'LineWidth',2)
plot(tSpan, x2_actual/Vol_2, 'LineWidth',2)
hold off
legend({'RK4 Method','Euler Method','ODE 45','Actual Solution'})
ylabel('x_2/100 (kg/Gal)');xlabel('t (sec)')
title('Salt concentration in Tank2')

function dx = fun(t, x)
    
    dx(1) = 3 - x(1)/30;
    dx(2) = x(1)/30 - x(2)/10;
    dx = dx';
end