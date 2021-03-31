K = [0.4 4 5;
    0.1 0 0;
    0 0.4 0];
A_0 = [1000 1000 1000]';
n = 4;
A = zeros(3,n);
A(:,1) = A_0;

for i = 2:n
    A(:,i) = K*A(:,i-1);
end