m = 5000;
for n= 2:10
    x = zeros(m,1);
    h = 1/(m-1);
    x(1) = 0;
    for i=2:m
        x(i) = x(i-1) + h;
    end
    X = zeros(m,n);
    X(:,1) = ones(m,1);
    for j = 2:n
        X(:,j) = X(:,j-1) .* x;
    end
    kappa(n,1) = cond(X)
end

plot(x,X(:,1));
hold on
plot(x,X(:,2));
plot(x,X(:,3));
plot(x,X(:,4));
plot(x,X(:,5));
plot(x,X(:,6));
title('Basis functions for Vandermonde functions');
legend( '1', 'x', 'x^2', 'x^3', 'x^4', 'x^5', 'Location','southeast');
axis( [0,1,-0.2,1.2] );
figure
semilogy([1:n],kappa)
title('Condition number');
xlabel('n');
ylabel('\kappa(X)');
legend( 'Vandermonde', 'Location', 'northwest')


