%% Part c)
clc; clear all; close all
syms x t
oldparam = sympref('HeavisideAtOrigin',1);
y = simplify(int( (exp(2*x)*heaviside(x)) * (exp(-3*(t-x))*heaviside(t-x)), x, [-inf inf] ));

y_2 = simplify(int( (heaviside(x)-2*heaviside(x-1)+heaviside(x-2)) *...
    (heaviside(t-x)-2*heaviside(t-x-1)+heaviside(t-x-2)), x, [-inf inf] ));
fun_1 = matlabFunction(y);
fun_2 = matlabFunction(y_2);
%% Part d)
x = -5:10;
fun1 = (exp(2.*x).*heaviside(x));
fun2 = (exp(-3.*x).*heaviside(x));
y = conv(fun2, fun1, 'same');
figure(1)
subplot(211)
plot(x, y)
title('Using conv')
subplot(212)
fplot(fun_1,[-5 10])
title('Original solution')

%% 
x = -5:10;
fun = (heaviside(x)-2*heaviside(x-1)+heaviside(x-2));
y = conv(fun, fun,'same');
figure(2)
subplot(211)
plot(x, y)
title('Using conv')
subplot(212)
fplot(fun_2,[-5 10])
title('Original solution')