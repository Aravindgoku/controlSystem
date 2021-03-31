clc; clear; close all

[t, x] = ode45(@(t, y) fun(t, y),[0 20], [5; 10] );

plot(t, x,'--','LineWidth', 2);
xlabel('time'); ylabel('Population')
legend('Rabbit', 'Sheep')

[x1, x2] = meshgrid(-1:0.1:2, -1:0.1:2);
x1dot = x1.*(1-x1)-x1.*x2; 
x2dot = x2.*(0.75-x2)-x1.*x2/2;

x_len = sqrt(x1dot.^2 + x2dot.^2);
x1dot_arr = x1dot./x_len;
x2dot_arr = x2dot./x_len;

quiver(x1, x2, x1dot_arr, x2dot_arr, 'r')
hold on
plot(0,0,'b.','MarkerSize',10)
plot(1,0,'b.','MarkerSize',10)
plot(0,3/4,'b.','MarkerSize',10)
plot(0.5,0.5,'b.','MarkerSize',10)
text(0.1,0,'(0,0)','FontSize',15)
text(1.1,0,'(1,0)','FontSize',15)
text(0,0.8,'(0,0.75)','FontSize',15)
text(0.6,0.6,'(0.5,0.5)','FontSize',15)
hold off
xlabel('x1')
ylabel('x2')
axis tight equal

function dy = fun(t, y)

dy(1) = y(1)*(1-y(1)) - y(1)*y(2);
dy(2) = y(2)*(3/4 - y(2)) - y(1)*y(2)/2;
dy = dy';

end
