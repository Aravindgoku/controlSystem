clc; clear; close all

[t, theta] = ode45(@f, [0 40], [2*pi, 0.2]);

subplot(211)
plot(t, theta(:,1), 'LineWidth',2)
% hold on
% fplot(@(t) 0.2*sqrt(L/g).*sin(sqrt(g/L).*t) + 0.1*cos(sqrt(g/L).*t),[0 20] )
hold off
subplot(212)
plot(t, theta(:,2), 'LineWidth',2)
% T = 2*pi*sqrt(L/g)

function dy = f(t, y)
g = 3.5;
L = 7;
mu = 4.1;
dy(1) = y(2);
dy(2) = -mu*y(2)-g*sin(y(1))/L;
dy = dy';
end