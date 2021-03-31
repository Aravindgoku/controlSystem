clc; clear; close all

%% 
syms f(x) % defining the symbolic function
f(x) = sqrt(2*x)-exp(x);
df = diff(f, x);
%% Part a)
x = 3;
df_3 = double(df(x)); % evaluating the derivative at x = 3
%% initialization
initial_dx = 0.5; 
step_size = 0.02;
final_value = 0.01;

dx = initial_dx:-step_size:final_value; % increament values of dx
dx(end+1) = final_value;
%% Part b) Central finite difference

df_cent_diff = (f(x + dx) - f(x - dx))./(2*dx); % central difference calculation
df_cent_diff_3 = double(df_cent_diff);

rel_cent_true_err = 100*(df_3 - df_cent_diff_3)./df_3; % relative true error calculation
%% Part c) 3 pt. forward diff app.

df_cent_diff = (-3*f(x) + 4*f(x + dx) - f(x + 2*dx))./(2*dx);
df_forward_diff_3 = double(df_cent_diff);

rel_forw_true_err = 100*(df_3 - df_forward_diff_3)./df_3;
%% Part d) 3 pt. backward diff app.

df_cent_diff = (3*f(x) - 4*f(x - dx) + f(x - 2*dx))./(2*dx);
df_backward_diff_3 = double(df_cent_diff);

rel_back_true_err = 100*(df_3 - df_backward_diff_3)./df_3;
%% Part e) Plots
plot(dx, rel_cent_true_err, dx, rel_forw_true_err, dx, rel_back_true_err,'LineWidth',2)
legend('Central diff. method','3 pt. Forward diff. app.','3 pt. Backward diff. app.')
set ( gca, 'xdir', 'reverse' ) % to plot from 0.5 to 0.01
xlabel('dx'); ylabel('% Relative error')