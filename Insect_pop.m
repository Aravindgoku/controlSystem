clc; clear all; close all

S = [0 0.5 0.75]'; % For three cases
n = 10; % no. of generations to be evalurated
x = zeros(3,n);
x(:,1) = 0.5; % initial condition

for i = 2:n
    x(:,i) = (3*(x(:,i-1)).^2)./(2*(x(:,i-1)).^2 + x(:,i-1) + S);
end

figure(1)
plot(1:n, x, 'LineWidth', 2)
ylabel('insect population');xlabel('generation')
legend({'S = 0','S = 0.5','S = 0.75'})

%% Problem 1)
fprintf('\n The percent insect population after six generations for x(1) = 0.5 and S = 0 : %d \n',x(1,6));

%% Problem 2)
fprintf('\n The percent insect population after three generations for x(1) = 0.5 and S = 0.5 : %d \n',x(2,3));

%% Problem 3)
fprintf('\n The percent insect population after seven generations for x(1) = 0.5 and S = 0.75 : %d \n',x(3,7));