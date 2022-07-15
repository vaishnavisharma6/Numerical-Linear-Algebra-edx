% Vandermonde matrix
m = 5000;
for n = 2:10
    x = zeros(m,1);
    h = 1/(m-1);
    x(1) = 0;
    for i = 2:m
        x(i) = x(i-1) + h;
    end
    X = zeros(m,n);
    X(:,1) = ones(m,1);
    for j = 2:n
        X(:,j) = X(:,j-1) .*x;
    end

    %Compute condition number
    kappa(n,1) = cond(X);
end
figure
plot(x,X(:,1));
hold on
plot(x,X(:,2));
plot(x,X(:,3));
plot(x,X(:,4));
plot(x,X(:,5));
plot(x,X(:,6));

title('Basis functions for Vandermonde matrix');
legend('1','x','x^2','x^3','x^4','x^5','Location','southeast');
axis([0,1,-0.2,1.2]);


% Legendre polynomial
for n = 2:10
    x = zeros(m,1);
    h = 1/(m-1);
    x(1) = 0;
    for i = 2:m
        x(i) = x(i-1) + h;
    end
    X = zeros(m,n);
    X(:,1) = ones(m,1);
    X(:,2) = 2*x - 1;
    for j = 1:n-2
        X(:,j+2) = ((2*j + 1)*(2*x - 1).*X(:,j+1)-j*X(:,j))/(j+1);
    end
    kappa(n,2) = cond(X);
end
figure
plot(x,X(:,1));
hold on
plot(x,X(:,2));
plot(x,X(:,3));
plot(x,X(:,4));
plot(x,X(:,5));
plot(x,X(:,6));
title('Shifted legendre polynomials');
xlabel('x');
ylabel('P_j(x)');
legend('P_0(x)','P_1(x)','P_2(x)','P_3(x)','P_4(x)','P_5(x)','Location','southeast');
axis([0,1,-1.2,1.2]);

%plot condition numbers for both methods as function of n
figure
semilogy([1:n],kappa)
title('Condition number');
xlabel('n');
ylabel('\kappa(X)');
legend('vandermonde','Shifted legendre','Location','northwest');

disp("X^T * X for n = 5")
round(X(:,1:5)' * X(:,1:5))


