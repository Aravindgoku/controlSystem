clc; clear; close all

h = 1/16;% 1/4, 1/8, 1/16
t = 0: h: 1;
n = length(t);
y = zeros(3, n);
y(:, 1) = [1; 3; 2];
y_exact = [0.25*(3*exp(-4*t) + 1); exp(log(3).*exp(-t)); 3*exp(-t) + t - 1 ];
err = zeros(3, n);
err(:, 1) = y_exact(:,1) - y(:, 1);

for i = 2:n
    y(:,i) = y(:, i-1) + fun(y(:,i-1),t(i-1))*h;
    err(:, i) = y_exact(:,i) - y(:,i);
end
max_err = max(err, [], 2)

figure(1)
subplot(311)
plot(t, y(1,:), 'LineWidth',2)
hold on
plot(t, y_exact(1,:), 'LineWidth',2)
hold off
legend('Analytical Solution', 'Exact Solution')
xlabel('t')
ylabel('y')

subplot(312)
plot(t, y(2,:), 'LineWidth',2)
hold on
plot(t, y_exact(2,:), 'LineWidth',2)
hold off
legend('Analytical Solution', 'Exact Solution')
xlabel('t')
ylabel('y')

subplot(313)
plot(t, y(3,:), 'LineWidth',2)
hold on
plot(t, y_exact(3,:), 'LineWidth',2)
hold off
legend('Analytical Solution', 'Exact Solution')
xlabel('t')
ylabel('y')

function dy = fun(y, t)
dy(1) = 1 - 4*y(1);
dy(2) = -y(2)*log(y(2));
dy(3) = t - y(3);
dy = dy';
end