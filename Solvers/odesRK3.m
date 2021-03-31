function y = odesRK3(func, t, y0)
    
    n = length(t);
    y = zeros(length(y0), n);
    y(:,1) = y0;
    
    for i = 2:n
        h = t(i) - t(i-1);
        F1 = h*func(t(i-1), y(:,i-1));
        F2 = h*func(t(i-1) + 0.5*h, y(:,i-1) + 0.5*F1);
        F3 = h*func(t(i-1) + 3*h/4, y(:,i-1) + 3*F2/4);
        
        y(:,i) = y(:,i-1) + (2*F1 + 3*F2 + 4*F3)/9;
    end
    
end