clc; clear; close all

k = 5;
m = 10;
x_0 = [1 0]';

[t, x] = ode45(@(t, y) f(t, y, k, m), [0 10], x_0);

subplot(211)
plot(t, x(:,1), 'LineWidth',2)
ylabel('Position'); xlabel('t')
subplot(212)
plot(t, x(:,2), 'LineWidth',2)
ylabel('Velocity'); xlabel('t')

nat_freq_rad = sqrt(k/m);
nat_freq_hz = nat_freq_rad/(2*pi);

function dy = f(t, y, k, m)
dy(1) = y(2);
dy(2) = -k*y(1)/m;
dy = dy';
end