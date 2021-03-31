clc; clear all; close all

h = 0.5;
x = 0: h: 2.5;
n = length(x);
y = zeros(3, n);
y(:,1) = 3;

for i = 2:n
    y(1,i) = y(1, i-1) + fun(y(1,i-1),x(i-1))*h; % Eulers Method
    k1 = fun(y(2,i-1),x(i-1));
    k2 = fun(y(2,i-1)+h*k1,x(i-1)+h);
    y(2,i) = y(2, i-1) + h*(k1 + k2)/2; % Modified Eulers Method
    y(3,i) = y(3, i-1) + h*fun( y(3,i-1) + h*fun( y(3,i-1), x(i-1) )/2, x(i-1)+h/2); % Mid point Method
end

figure(1)
plot(x, y(1,:), 'LineWidth',2)
hold on
plot(x, y(2,:), 'LineWidth',2)
plot(x, y(3,:), 'LineWidth',2)
hold off
legend('Euler method', 'Modified Euler method', 'Mid point method')
xlabel('x')
ylabel('y')

function dy = fun(y, x)
dy = -1.2*y + 7*exp(-0.3*x);
end