clc; clear; close all

h = 0.001;
t = 0: h: 5;
n = length(t);
y = zeros(2, n);
y(:, 1) = [100; 150];

for i = 2:n
    y(:,i) = y(:, i-1) + fun(y(:,i-1),t(i-1))*h;
end

figure(1)
plot(t, y(1,:), 'LineWidth',2)
hold on
plot(t, y(2,:), 'LineWidth',2)
hold off
legend('x(t)', 'y(t)')
xlabel('t')

fprintf('\nThe value of x(5) : %d\nThe value of y(5) : %d\n',y(1,end), y(2,end));

function dy = fun(y, t)
V = 1.4;
K = 250;
S = 0.9;

dy(1) = (V*y(1)*y(2))/(K + y(2));
dy(2) = (-V*y(1)*y(2))/(S*(K + y(2)));
dy = dy';
end