clc; clear all; close all
syms s t
u = matlabFunction(simplify(ilaplace(...
    laplace( exp(-t) *(t-sin(t)) )*(s^3 + s^2 -2) )));
%%
x_0 = [0; 0; 0];
[t, y] = ode45(@fun,[0 20], x_0);
figure(1)
plot(t, y(:,1))
hold on
plot(t, exp(-t).*(t-sin(t)))
legend('ODE45', 'Part(b) solution')
hold off

function dydt = fun(t, x)
u = -exp(-t)*(2*t-1);
dydt = [x(2); x(3); -x(3) + 2*x(1) + u];
end
