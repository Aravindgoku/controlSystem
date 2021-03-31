clc; clear; close all

load mydata1.mat x y

A = [x',ones(size(x))'];
B = y';
X = A\B; 

X_pseudo_inverse = (A'*A)\A'*B; % Pseudo Inverse Method
X_p = polyfit(x,y,1); % MATLAB in-built function

Y = X(1).*x + X(2); % Best fit line

plot(x,y,'r.','MarkerSize',10);
hold on
plot(x, Y,'b','LineWidth',2);
hold off
xlabel('x'); ylabel('y')