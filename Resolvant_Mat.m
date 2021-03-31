clc; clear; close all

syms s t
B = ones(2,2);
resolv_mat = inv(s*eye(size(B,1))-B);
exp_Bt = ilaplace(resolv_mat, s, t);