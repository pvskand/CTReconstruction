function x = art(A,B,iter)

[M,N] = size(A);
x = zeros(N,1);
A2 = sum(A.*A,2);
lambda = 0.2;

    for i = 1:iter
       
        x = x+(lambda/(A(i, :)'*A(i, :)))*(b(i, 1) - A(i, :)'*x).*A(i, :);
    end
end
