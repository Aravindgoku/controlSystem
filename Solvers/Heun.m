clc; clear; close all
dt = 0.01;
tMax = 20;
t = 0:dt:tMax;
n = length(t);

v = zeros(3,n);
v_0 = [0 5 -39]';
v(:,1) = v_0;

A = [0 1 0;
    0 0 1;
    -12 -4 -3];

for i = 2:n
    k1 = A*v(:,i-1);
    v1 = v(:,i-1) + k1*dt;
    k2 = A*v1;
    v(:,i) = v(:,i-1) + dt*(k1+k2)/2;
end

y= v(1,:);
plot(t,y)
xlabel('x');ylabel('y')
text(t(end)/2,y(end)/2,'y(x)')