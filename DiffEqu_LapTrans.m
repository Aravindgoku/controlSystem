clc; clear ; 

syms y(t) s Y_s dy_0 % dy_0 is for y'(0), Y_s is for Y(s)

eqn = diff(y,t,2) + 4*y == dirac(t-pi) - dirac(t-2*pi);
LT_eqn = laplace(eqn, t, s);

LT_eqn_s = subs(LT_eqn,[laplace(y(t), t, s) subs(diff(y(t), t), t, 0)],[Y_s dy_0]);% Changing variable names
y_s = solve(LT_eqn_s, Y_s);% Solving for Y(s)
y_t = simplify(ilaplace(y_s, s, t));
y_sol = subs(y_t, [y(0) dy_0],[0 0]);% Applying initial conditions