function x = sart(A,B,iter)


x = zeros(size(A,2),1); % initial x values
sr = sum(A,1);
sc = sum(A,2);
lambda = 0.2;

for i = 1:iter

    for j = 1:size(A,2)
        dis = (B-A*x);
        x(j) = x(j)+lambda*sum(dis./sc.*A(:,j),1)/sr(j); % update equation
    end
end
end
