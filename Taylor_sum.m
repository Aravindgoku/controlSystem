clc; clear; close all

x = input('Enter the value for x:');
a = input('Enter the value for a:');

n = 1;
S_previous = 1;

while n==1 || ~(E < 0.000001)
    
    c_n = ((log(a))^n)*(x^n)/factorial(n);
    S_current = S_previous + c_n;
    E = abs((S_current - S_previous)/S_previous);
    S_previous = S_current;
    n = n+1;
    
end

fprintf('Current Sum: %f',S_current)
fprintf('\nPrevious Sum: %f\n',S_current - c_n)