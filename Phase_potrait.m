clc; clear; close all
syms t

[x1, x2] = meshgrid(-2:0.1:4, -2:0.1:4);
x1dot = x2; 
x2dot = 0.5 - sin(x1) - x2;

x_len = sqrt(x1dot.^2 + x2dot.^2);
x1dot_arr = x1dot./x_len;
x2dot_arr = x2dot./x_len;

quiver(x1, x2, x1dot_arr, x2dot_arr, 'r')
hold on
plot(pi/6,0,'b.','MarkerSize',10)
plot(5*pi/6,0,'b.','MarkerSize',10)
text(1,0,'(\pi/6,0)','FontSize',15)
text(3,0,'(5\pi/6,0)','FontSize',15)
hold off
xlabel('x1')
ylabel('x2')
axis tight equal
% xlim([-2 2]);ylim([-2 2])
