clc; clear;

syms y1(t) y2(t)
A = [-2/5 3/10;
    1/5 -3/10];
% Y_0 = [1; 0.4];
[V, D] = eig(A);
Y = [y1; y2];

eqn = diff(Y) == A*Y;
% ic = Y(0) == Y_0;
y_sol_struct = dsolve(eqn);
y_sol = [y_sol_struct.y1; y_sol_struct.y2];

C = [-0.24 -0.6 0.84;
    0.16 -0.6 0.84];


